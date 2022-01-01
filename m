Return-Path: <SRS0=LxC5=RR=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E75AC4332F
	for <soc@archiver.kernel.org>; Sat,  1 Jan 2022 20:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06A49C36AE9; Sat,  1 Jan 2022 20:27:36 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDC02C36AEC;
	Sat,  1 Jan 2022 20:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDC02C36AEC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=i2se.com
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N4Q8u-1mNJUA3VhO-011R9z; Sat, 01 Jan 2022 21:27:16 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Chi-hsien Lin <chi-hsien.lin@infineon.com>,
	Wright Feng <wright.feng@infineon.com>,
	Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
	Kalle Valo <kvalo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 1/4] brcmfmac: use separate firmware for 43430 revision 4
Date: Sat,  1 Jan 2022 21:26:49 +0100
Message-Id: <1641068812-5851-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1641068812-5851-1-git-send-email-stefan.wahren@i2se.com>
References: <1641068812-5851-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:gbP/sU8ZIGxy06v2ug+WXnZFZ7jofwY7iLEid7yG1YEy2peckqw
 blWo1Fu/bUb4yjxr0UDvV85nPuBNwfaP8gYYypSFkles0VjBmbU8FeavVJbo6SYyzopL62p
 WEFZ2zeTW9O0yMHcJZopr/E+gNa4rruTor2G3+1UQNH9g4mJDRAYVJfvk/LTX5QcR/iWzoH
 7rTfMDofdb2q5eGF+EQtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8AXvqx+XFYo=:xpc3rhMdo1k55aT0TB8jar
 Z+b73VPGMgq8WivDZ/l85YinrI68a7dZ1mh8ayqp4J44nrdB+7NWjtcMjdXhArIi15qBPWtEb
 hYWt7Rl4NCMCSDc3J/8gB1cMFD6TEAw4B7sbEOS4dy4CNGTUQ+HeQ6lSjhy/ONZn8H+nCd4gN
 kV8ifov8ieZAaLiLYSnbox5Hedi4rzXU8VPnwhDcXL+zjjj8B6au7J978sX2czUhmbx5/QJ+z
 Ir7AyTJgcNiysXOiisrRCMzONCn6Ocg2IwED1Zjx64slEpZrdGB5Q4hTuc08fDXhAYiB0a1fX
 CkaqTVrvA5V1LRzmZpS+F0uB23/kQrlfb8tte2MFhF0l4AHtAnCPNY5J5c9lwbTXN0ydEU6eP
 mKB/XOUWRPlm8Ac4CwZT45aHngsDBbgUBYwVsHLI0gK0pgPGBjj71HoSyHBd+usTXNYgBEyfQ
 vaDIhH0DHwczdmpP2pKQjCSsGdP9SRy9N5fbaFDnVMOdJ2g5NBqQTfePbyFtZxATx/9Vd2LgG
 NIkAjJ73qvfqrEiwkoq3FJdIAyAcUsiYBw1ey+h1hdwoi228If9JZVAJVNm/TEmLe4JO7VOAX
 ItKkw5akvzRH2ReeQg27CLyYiqb4YTUXBzpdfF1hU1Zr4QAQaoIfhMHa76YDWtQqw9PdDTFLY
 8ecV4KZnsbVTe8B/lF42ocBmC8ltEHeSvBL2ZOYOMypz8DKBLChNugBkhe9SGZJyhVTemlxqc
 kMoKLhfVcF8tKsdY

A separate firmware is needed, for Broadcom 43430 revision 4. This
chip can be found on e.g. certain revisions of Raspberry Pi Zero 2 W.
Original firmware file from IC vendor is named 'brcmfmac43436-sdio.bin',
but brcmfmac and also btbcm drivers report chip id 43430, so requested
firmware file name is 'brcmfmac43430c0-sdio.bin' in line with other
43430 revisions.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---

Hi,
i'm not sure about all these mappings. All i can say is that the wifi
interface of the RPi Zero 2 cames up with this patch.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index 8effeb7..c79bd47 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -618,6 +618,7 @@ BRCMF_FW_DEF(43430A0, "brcmfmac43430a0-sdio");
 /* Note the names are not postfixed with a1 for backward compatibility */
 BRCMF_FW_CLM_DEF(43430A1, "brcmfmac43430-sdio");
 BRCMF_FW_DEF(43430B0, "brcmfmac43430b0-sdio");
+BRCMF_FW_CLM_DEF(43430C0, "brcmfmac43430c0-sdio");
 BRCMF_FW_CLM_DEF(43455, "brcmfmac43455-sdio");
 BRCMF_FW_DEF(43456, "brcmfmac43456-sdio");
 BRCMF_FW_CLM_DEF(4354, "brcmfmac4354-sdio");
@@ -649,7 +650,8 @@ static const struct brcmf_firmware_mapping brcmf_sdio_fwnames[] = {
 	BRCMF_FW_ENTRY(BRCM_CC_4339_CHIP_ID, 0xFFFFFFFF, 4339),
 	BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0x00000001, 43430A0),
 	BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0x00000002, 43430A1),
-	BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0xFFFFFFFC, 43430B0),
+	BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0x00000004, 43430C0),
+	BRCMF_FW_ENTRY(BRCM_CC_43430_CHIP_ID, 0xFFFFFFF8, 43430B0),
 	BRCMF_FW_ENTRY(BRCM_CC_4345_CHIP_ID, 0x00000200, 43456),
 	BRCMF_FW_ENTRY(BRCM_CC_4345_CHIP_ID, 0xFFFFFDC0, 43455),
 	BRCMF_FW_ENTRY(BRCM_CC_4354_CHIP_ID, 0xFFFFFFFF, 4354),
-- 
2.7.4

