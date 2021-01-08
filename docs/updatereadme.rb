# coding: utf-8
require 'date'
require 'active_support/core_ext/integer/inflections'
require 'open3'
require 'nokogiri'
require 'open-uri'

def get_file_name(file)
  begin
    awk1 = "awk '{print $0}'"
    awk2 = "awk '{$1=$2=\"\"; print $0}'"
    command = "bsdtar -xOf #{file} | #{awk1} | grep -I pkgname | #{awk2}"
    stdin, stdout, stderr, wait_thr = Open3.popen3(command)
    output = stdout.gets(nil)
    return output.strip.to_s
  rescue => e
    retry
  end
end

def get_file_version(file)
  begin
    awk1 = "awk '{print $0}'"
    awk2 = "awk '{$1=$2=\"\"; print $0}'"
    command = "bsdtar -xOf #{file} | #{awk1} | grep -I pkgver | #{awk2}"
    stdin, stdout, stderr, wait_thr = Open3.popen3(command)
    output = stdout.gets(nil)
    return output.strip.to_s
  rescue => e
    retry
  end
end

def get_aur_maintainer_name(name)
  begin
    aur_maintainer = Nokogiri::HTML.parse(URI.open("https://img.shields.io/aur/maintainer/#{name}"))
    title = aur_maintainer.title.gsub('maintainer: ', '')
    if title == "package not found"
        new_name = "#{name}-git"

        aur_maintainer = Nokogiri::HTML.parse(URI.open("https://img.shields.io/aur/maintainer/#{new_name}"))
        title = aur_maintainer.title.gsub('maintainer: ', '')

        if title == "package not found"
            new_name = "#{name}-bin"
            aur_maintainer = Nokogiri::HTML.parse(URI.open("https://img.shields.io/aur/maintainer/#{new_name}"))
            title = aur_maintainer.title.gsub('maintainer: ', '')
        end
    end
  rescue => e
    retry
  end

  return title
end

def get_aur_license_name(name)
  begin
    aur_maintainer = Nokogiri::HTML.parse(URI.open("https://img.shields.io/aur/license/#{name}"))
    title = aur_maintainer.title.gsub('license: ', '')
    if title == "package not found"
        new_name = "#{name}-git"

        aur_maintainer = Nokogiri::HTML.parse(URI.open("https://img.shields.io/aur/license/#{new_name}"))
        title = aur_maintainer.title.gsub('license: ', '')

        if title == "package not found"
            new_name = "#{name}-bin"
            aur_maintainer = Nokogiri::HTML.parse(URI.open("https://img.shields.io/aur/license/#{new_name}"))
            title = aur_maintainer.title.gsub('license: ', '')
        end
    end
  rescue => e
    retry
  end

  return title
end

open('../README.md', 'w') { |f|
  f.write("")
}

files = Dir["*.pkg.tar.zst"].sort
for file in files
  begin
    ignore = open("../ignorepackages", "r").read
    name = get_file_name(file.to_s)
    if not ignore.include?(name)
      version = get_file_version(file.to_s)
      if not name
        name = get_file_name(file.to_s)
      end
      if not version
        version = get_file_name(file.to_s)
      end

      print("File Updated: (#{name} v#{version}) #{get_aur_maintainer_name(name)} #{get_aur_license_name(name)}\n")
      open('../README.md', 'a') { |f|
        f.write("*   [#{name}](docs/#{name}/) Version: #{version} ![AUR maintainer](https://img.shields.io/aur/maintainer/#{get_aur_maintainer_name(name)}?color=blue&style=flat-square) ![AUR maintainer](https://img.shields.io/aur/license/'#{get_aur_license_name(name)}?color=orange&style=flat-square)\n")
      }
    end
  rescue TypeError
    retry
  end
end

multiline_addrepo = ("\n## Add my repo\n"\
"* **Maintainer:** [TheCynicalTeam](https://aur.archlinux.org/account/TheCynicalTeam/)\n"\
"* **Description:**  A repository with some AUR packages that the team uses\n"\
"* **Upstream page:** https://arch.therepo.club/\n"
"* **Key-ID:** 10DF 44AC D4C8 4539 53B7 CCBA 206A DED6 6160 901B\n"\
"* **Fingerprint:** [download](http://pgp.net.nz:11371/pks/lookup?op=vindex&fingerprint=on&search=0x96414492E2220753)\n"\
"\nAppend to */etc/pacman.conf*:\n```\n[therepoclub]\nSigLevel = Required DatabaseOptional\nServer = https://arch.therepo.club/$arch/\n```"\
"\nTo check signature, add my key:\n"\
"```\nsudo pacman-key --keyserver hkp://pgp.net.nz --recv-key 75A38DC684F1A0B808918BCEE30EC2FBFB05C44F\nsudo pacman-key --keyserver hkp://pgp.net.nz --lsign-key 75A38DC684F1A0B808918BCEE30EC2FBFB05C44F\n```")

open('../README.md', 'a') { |f|
  f.write(multiline_addrepo)
}

d = Time.new
dt = DateTime.now.strftime("Last updated on: %a #{d.day.ordinalize}, %b %Y at %I:%M:%S%p")

multiline_showsupport = ("\n## Show your support\n"\
"\nGive a ⭐️ if this project helped you!\n"\
"\nThis README was generated with ❤️ by [TheCynicalTeam](https://github.com/TheCynicalTeam/)\n"\
"*   #{dt}")

open('../README.md', 'a') { |f|
  f.write(multiline_showsupport)
}