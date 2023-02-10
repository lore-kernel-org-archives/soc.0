Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FD0C636D4
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 19:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20EA7C433D2; Fri, 10 Feb 2023 19:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AA9C433EF;
	Fri, 10 Feb 2023 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676058848;
	bh=nsmQ8mzzBPC/f5MAnzy1radWD3NAl9utzK3f533PzlI=;
	h=From:Subject:Date:List-Id:To:Cc:From;
	b=g47y6o+6QJm3er8NRCuRZYoCMN8K4JDACMwcLu3qkDT3fD5Zg0UFwlnCxSCd9tEWO
	 b2IHrOj9VM+u+t7wT2+xwQ3z815LDMBahQT/Nzm+jP8jtZJGTkUa0kPaIM57M8UCbT
	 NbJHkoSFGs1qqbgmsi4e2t1u8BV1F8eSyUTzTYJNT6YVq3tTjF9O5E1f/h7niRRk8t
	 TSti2i3zYcgx+AnlAe6Jx4dT4p5ch/ZU/qHaZY8h5QkWm9fGrmeE8f2wmTcm6IBKnW
	 Ji5WbfdVeiebDJ3VLpuAzrDHVcmWd8wk6GPQq4sMJbTi79G4khPsA06yo5dsqptUQK
	 um9hZZTIAgQcQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] arm64: configs: Provide slimmed down configuration for
 guests
Date: Fri, 10 Feb 2023 19:52:46 +0000
Message-Id: <20230203-arm64-defconfigs-v1-0-cd0694a05f13@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6g5mMC/x2NQQqDQAwAvyI5d2G7WpF+pfQQY6KhdLck0Ari3
 117nIFhNnA2ZYd7s4HxV11LrnC9NEAL5pmDTpUhxdTGFNuA9u67MLFQyaKzB4odyU2wT8MANRv
 ROYyGmZYz/BV7nfpjLLr+T4/nvh9uXddXeQAAAA==
List-Id: <soc.lore.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Nicolas Schier <nicolas@fjasle.eu>, soc@kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nsmQ8mzzBPC/f5MAnzy1radWD3NAl9utzK3f533PzlI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj5qDZb4X/Wa76Ug/4curQpsp8m4dC9ZVSrkjzbdNX
 sPQAYaGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY+ag2QAKCRAk1otyXVSH0Ki9B/
 41RoyqrQ6eArzF2vEdj/jjZuM/P1XkrkZixbZ6w6F1Dvt6rmuKFwnRcrKc3u+T4+oHdNvri4e0RZn/
 KkGBuuPzlwNlysnmxUviuH41+eb3lv/Zwl5lFVCfDNMd0PtONIEKDebXCIzDiIKUaNloXmW/FoC/4o
 TmGMpnSIuvLYZjk5mu2YSIbmhpoPy3SsZxmWc3c421k/QfM5aQUnVyP+8uQJDwRDRuh83f/qeVBsjR
 el4ifKhcnO0pL5+VjX9tABzhNTKjAR9yitobP15lz8zh2Q7abHIQ0X5khT/85Vsk7MXvvQrCu6ye5p
 2STQa35apIqC1Q921JySrzPgZa9ltB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

It has been noted that due to the extensive platform support it
enables the arm64 defconfig is rather large and takes a while to
build in comparison with other architectures which can be a
burden when doing cross architecture work, especially when
testing is mainly in emulation.  We can mitigate this by providing
a configuration that only enables the support required to run in
mach-virt, this will be much smaller and quicker to build.

Having two completely separate configurations would mean that we'd
need to make any changes to the architecture wide configuration in
both the existing defconfig and the new configuration if we wanted to
ensure consistent default behaviour.  Instead define a new config
fragement which turns off options from defconfig which enable platform
support, currently this just covers the ARCH_ options that control SoC
specific drivers as validation for this approach - if people are happy
with this approach we can build on it to further reduce the size of the
new configuration.

The resulting configuration builds about 25% faster for me.

v2:
 - Rework to base on turning off options from defconfig rather than 
   splitting out a base configuration and then adding things to it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (3):
      scripts: merge_config: Add option to suppress warning on overrides
      kbuild: Provide a version of merge_into_defconfig without override warnings
      arm64: configs: Add virtconfig

 arch/arm64/Makefile             |  6 ++++++
 arch/arm64/configs/virt.config  | 39 +++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.defconf        | 14 ++++++++++++++
 scripts/kconfig/merge_config.sh | 25 ++++++++++++++++---------
 4 files changed, 75 insertions(+), 9 deletions(-)
---
base-commit: 4fafd96910add124586b549ad005dcd179de8a18
change-id: 20230203-arm64-defconfigs-c04cf5fa6288

Best regards,
-- 
Mark Brown <broonie@kernel.org>

