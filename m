Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867935F8D6
	for <soc@lists.linux.dev>; Mon, 12 Jan 2026 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232136; cv=none; b=Z6TQwo8Tj4dOuDdh072gt+arijOzWjaRxfAZ82zlNLgKiMaoSTk+KJ0CUuvNL4i7wPFdaf2tXF1Oq+2sb/te6Q8pvT0J+6NCtZjFEHfFejf0R8Xs5ljh+uXmAG7eGACauNqNmcImjJxlAyUczY9CpfJajEiqzX/XXphfhVNDgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232136; c=relaxed/simple;
	bh=VJbJChd8N/LfN0hMbX+wa83dkNT92miG2RddNVLajrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NBdUneMeZldcTn2McxXEvKPtHMgXLqD5IxQWbpJGn78/p8kNh9spXcd3rG4yCussCRg4nI1aIlrfcfSeueieEtw4PMr+ySVSm7/ORZlOXGEGtsBNxQnnXk8uCmg6qf+NQ+XDhr+7Qy7NsBhPltvtzX6FmUwPij6RkBxu10pmXnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9aLuI8P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9aLuI8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297CBC19422;
	Mon, 12 Jan 2026 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768232135;
	bh=VJbJChd8N/LfN0hMbX+wa83dkNT92miG2RddNVLajrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U9aLuI8PO6Z01Vz9i1Xm/nKhIEKBFPDAzMIxe5VxPFutzNtC3v3wx1HUUxDcXDaQV
	 T5CSNIdIhp47zUPnYbqQZRLG1PQ33E2kSuR9XKIBfC/mHyAuWt1yEKgESIdsvD/ADP
	 dOiO+eKDcsc/yfhEAJGaU9SpPhIAKgRItZbGTVSrgsB0g1km4fVY/oAF0ufoE4veKa
	 SVPPRJfBpXGng22aSOHoNkB1+8coavyAxDgnIB5ZjlOVDTcvl2Vt41jBr5bn7VNx9N
	 g92gaLOwxTV8VhyIeBPXjkcl6EbKHAqHAlF8pPEyZ5jc0t0QjAis8twFbHm7qKvpG4
	 SLJVBkNUgfmdw==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 2/2] ARM: defconfig: turn off CONFIG_EXPERT
Date: Mon, 12 Jan 2026 16:32:55 +0100
Message-Id: <20260112153255.795553-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260112153255.795553-1-arnd@kernel.org>
References: <20260112153255.795553-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Since multi_v7_defconfig is meant to be the generic defconfig, many
users are not going to be experts and it is counterintuitive to have
CONFIG_EXPERT enabled.

This change has a couple of side-effects:

 - CONFIG_NAMESPACES is enabled by default. This adds about 0.2% of
  .text, but is already enabled in many board specific configs, and
   apparently a requirement for systemd, so this seems like a useful
   change.

 - CONFIG_DEBUG_MEMORY_INIT is enabled now, adding a tiny bit
   of code in the inittext section

 - CONFIG_RFKILL, CONFIG_MEDIA_SUPPORT_FILTER and various CONFIG_HID
   driver defaults change, so these have to be listed explicitly to
   maintain the previous behavior

 - CONFIG_SERIAL_SH_SCI_NR_UARTS=20 changes to the default value
   of 18, which I understand to be sufficient for any buard, even
   if all UARTS are enabled at the same time

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/multi_v7_defconfig | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 22c50b60c794..52b2e792ad42 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -3,7 +3,6 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 CONFIG_KEXEC=y
 CONFIG_ARCH_VIRT=y
@@ -163,7 +162,6 @@ CONFIG_BT_QCOMSMD=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_RFKILL=y
-CONFIG_RFKILL_INPUT=y
 CONFIG_RFKILL_GPIO=y
 CONFIG_NFC=m
 CONFIG_NFC_DIGITAL=m
@@ -376,7 +374,6 @@ CONFIG_SERIAL_TEGRA=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_SH_SCI_NR_UARTS=20
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_VT8500=y
@@ -676,6 +673,7 @@ CONFIG_REGULATOR_WM8994=m
 CONFIG_CEC_SAMSUNG_S5P=m
 CONFIG_CEC_STM32=m
 CONFIG_MEDIA_SUPPORT=m
+# CONFIG_MEDIA_SUPPORT_FILTER is not set
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
@@ -859,6 +857,18 @@ CONFIG_SND_SOC_WM8960=m
 CONFIG_SND_SOC_WM8962=m
 CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
+# CONFIG_HID_A4TECH is not set
+# CONFIG_HID_APPLE is not set
+# CONFIG_HID_BELKIN is not set
+# CONFIG_HID_CHERRY is not set
+# CONFIG_HID_CHICONY is not set
+# CONFIG_HID_CYPRESS is not set
+# CONFIG_HID_EZKEY is not set
+# CONFIG_HID_ITE is not set
+# CONFIG_HID_KENSINGTON is not set
+# CONFIG_HID_REDRAGON is not set
+# CONFIG_HID_MICROSOFT is not set
+# CONFIG_HID_MONTEREY is not set
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.39.5

