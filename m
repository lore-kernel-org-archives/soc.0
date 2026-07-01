Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F73DE447;
	Wed,  1 Jul 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941150; cv=none; b=PJvc1Ojp8wjxahm+YVcoQD98MoFX1tg8sMuJYmIoIkx96r9of14m+jiZEz0bNP/ij9emZ8XcSOsCaqXe72TTIGcqiRXLVdVQdhi5C9MadoDzFsUB/WNh6Xfu+zjK4Udn5SslWO9maOyFpst153L9PanEw/QYDzr05vwH6BJqC+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941150; c=relaxed/simple;
	bh=DVQ/vZVFITdeywO93mSOUaY3nuy/xBCJk2K6n32kK+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=idUD527Ql/tosI/egtCJ/eUQhxrGsdS6Cwf04R4Mr0EHRdew85d34Z27DL7qDCXOLBkeX1nMhpNIQx8mVcuqxmr6RRvIbRVJNFwlEW2ksmGb8XPhSV/pCYo46u/YO8H8qEh0hLljzTVN9Qw7+YmXedJJgKvrtwuohTFLHUQtpts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGuO26ph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGuO26ph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A6F1F000E9;
	Wed,  1 Jul 2026 21:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941147;
	bh=g0Gr+nS5mCCQMtHO6PX506rXj22uuIPGttVk73FvkJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aGuO26phr8PkWfQc53Z8FnkPJK/4L/Noq7AKU3jcM/lvzw/RXgctcm0Nq9SLyYBuj
	 ujFJEGG8lRONAlHWG+JZqm0OWqjBk8nav5y1iM56Nn6lf8FlLnpUiItnjUfZeJe8O8
	 poVjtL8VSDOQCd+gLtXQbTdzbrI4qsSWzP5oN6Dzib7Vw4JanIceDvQ+cUXyLEBc+8
	 AjrZEo2J1DUV6qWzyqMKSDU7RXgVWoWuc+3DKFN43HtNrFwLRKuI+vmPzmc61B+H1n
	 dCoKYfAFRXRY2sI6FqjIurIkovRzxDxlWLFWJbL/KjEX3Dx0gL69SI8aYoa7TydxRL
	 7wAo14QV/Bcuw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 12/19] ARM: PXA: mark remaining board files as deprecated
Date: Wed,  1 Jul 2026 23:23:46 +0200
Message-Id: <20260701212353.2196041-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260701212353.2196041-1-arnd@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

In the 2021 board file removal, the gumstix and sharpsl
support was left around in order to make it easier to convert
more of the PXA platform to device tree, given that both
platforms had some level of support in qemu.

As far as I can tell, nobody has worked on additional DT
conversion in that time, and qemu has in turn deprecated
the entire PXA platform.

Schedule the remaining board files for removal now, as they
are unlikely to be of any help in the future. If anyone
wants to revive support for these machines, they can
obviously still contribute device tree based code and
work on updating the corresponding drivers.

Any drivers that are only usable on legacy PXA board files
can also get removed along with the boards, or saved by
adding devicetree support.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/pxa_defconfig |  4 ----
 arch/arm/mach-pxa/Kconfig      | 10 ++++++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index 396680975506..e7a7ed2b7ef7 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -16,10 +16,6 @@ CONFIG_PROFILING=y
 CONFIG_KEXEC=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
-CONFIG_ARCH_GUMSTIX=y
-CONFIG_PXA_SHARPSL=y
-CONFIG_MACH_AKITA=y
-CONFIG_MACH_BORZOI=y
 CONFIG_ARCH_FORCE_MAX_ORDER=8
 CONFIG_CMDLINE="root=/dev/ram0 ro"
 CONFIG_CPU_FREQ=y
diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
index 66e26990e2c8..1fa282a9ef38 100644
--- a/arch/arm/mach-pxa/Kconfig
+++ b/arch/arm/mach-pxa/Kconfig
@@ -58,12 +58,15 @@ if ATAGS
 comment "Legacy board files"
 
 config ARCH_GUMSTIX
-	bool "Gumstix XScale 255 boards"
+	bool "Gumstix XScale 255 boards (DEPRECATED)"
 	select PXA25x
 	help
 	  Say Y here if you intend to run this kernel on
 	  Basix, Connex, ws-200ax, ws-400ax systems
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 choice
 	prompt "Gumstix Carrier/Expansion Board"
 	depends on ARCH_GUMSTIX
@@ -77,7 +80,7 @@ config GUMSTIX_AM300EPD
 endchoice
 
 config PXA_SHARPSL
-	bool "SHARP Zaurus SL-5600, SL-C7xx and SL-Cxx00 Models"
+	bool "SHARP Zaurus SL-5600, SL-C7xx and SL-Cxx00 Models (DEPRECATED)"
 	select SHARP_PARAM
 	select SHARP_SCOOP
 	help
@@ -87,6 +90,9 @@ config PXA_SHARPSL
 	  SL-C3000 (Spitz), SL-C3100 (Borzoi) or SL-C6000x (Tosa)
 	  handheld computer.
 
+	  Support for these machines will go away in early 2027,
+	  unless they get converted to device tree.
+
 config PXA_SHARPSL_DETECT_MACH_ID
 	bool "Detect machine ID at run-time in the decompressor"
 	depends on PXA_SHARPSL
-- 
2.39.5

