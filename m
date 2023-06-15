Return-Path: <SRS0=64cw=CD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E21EB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1F60C433C9; Thu, 15 Jun 2023 16:27:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E823AC433C0;
	Thu, 15 Jun 2023 16:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E823AC433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f8cc042e2bso18799905e9.2;
        Thu, 15 Jun 2023 09:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686846459; x=1689438459;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gm5bdbydl7P55FhJikMBfS5unSgMEPvVoXjuwRTRA3A=;
        b=AOjJ6Zh43oX3Z+7YbeUC83PR7jnKxbUfGOzyrn/qV5yHp3ory25w1zNENlnIXnEIwY
         FNxiN073X2kNfck8vdiZnqwSS1YNOwcl3PRcw0GiwGtYtPbFtPDuk5BMF8Ye4sIqIowH
         Hx7CYLCSMhpHsY8FppSN/YKBHrIwKEbBh/n9rOziw62jI3RsKUbw98NGpjYezgIY0jLW
         7NMKLYCEBY2ppuZZA/tqhmPcd5AQc3GDyzbp00yI9HEta2p/0FIOGld87qUpVpJ8K36i
         fzTwvYSWEcWD4I4CSKLqlAwOZDp21I//VtHqjfxW5mkhM8ng4hedwEDPuJgSC4tzJ7tD
         pLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686846459; x=1689438459;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gm5bdbydl7P55FhJikMBfS5unSgMEPvVoXjuwRTRA3A=;
        b=ErTKwv+B9ZEsjgViGw+zjVgZcg8cS474tE5BXyJiiO936eYvnPQqYuW88Xx6UgoQPy
         hUNyjI/tv6mDo0ontyzaPitj+lGUgV2kMK7+v2HKlmHlHV6IaptCwEO4Qs0oRW+mRKpb
         q1Hx7vBcUrCm85jftEngt66j8cT0MR9sYedmmLZd7LvRXacQX+V3ByMygX+/UNXSuPgB
         pQliGwrCCFoxQyx/fQmaES25QsiOAbg62kfDNtBrx2xipZuNlWiqCdYjqyEcTbhwgaQg
         UwYJ5I51xMypDR/SyCfW6Jp3EY6FPHRO+WNPfZpSxR+6phDfCu1gDFXBiapRfmpA2GMk
         UNcw==
X-Gm-Message-State: AC+VfDx06wHtef5iIqBSYuP7DunWfdCfZqd4cJAJXbmcWYaPbyDpYRuK
	pockf/rnLrMHT1j+mEHovFd2dZw9SZA=
X-Google-Smtp-Source: ACHHUZ4WZQt4nAI0OwxT1urrmULNCeQZ2a3G+Jy3IexgZxnc6PGVQvqVm7Cym8+zRV9cLoTRuLfPog==
X-Received: by 2002:a1c:7c19:0:b0:3f5:ff24:27de with SMTP id x25-20020a1c7c19000000b003f5ff2427demr12465132wmc.32.1686846458790;
        Thu, 15 Jun 2023 09:27:38 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c740b000000b003f733c1129fsm21025844wmc.33.2023.06.15.09.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 09:27:37 -0700 (PDT)
Message-ID: <98e21acb-d792-6a8c-2de6-12d5af8a8111@gmail.com>
Date: Thu, 15 Jun 2023 18:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US, ca-ES, es-ES
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: mediatek: dts32 updates for v6.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

Please have a look on the arm 32 bit device tree changes for this round. This 
time it's rather small and only contains smaller changes to the SoC used in the 
BPI-R2 board.

Regards,
Matthias

---

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.4-next-dts32

for you to fetch changes up to 115ee470e5d2438f9c36802fc47bcb2297ec33be:

   arm: dts: mt7623: add port@5 as CPU port (2023-06-09 16:33:29 +0200)

----------------------------------------------------------------
MT7530 (e.g. BPI R2):
- several DT clean-ups
- add port5 as CPU port

----------------------------------------------------------------
Arınç ÜNAL (5):
       arm: dts: mt7623: add gmacs to mt7623.dtsi
       arm: dts: mt7623: add mt7530 switch to mt7623a.dtsi
       arm: dts: mt7623: change mt7530 switch address
       arm: dts: mt7623: enable flow control on port@6
       arm: dts: mt7623: add port@5 as CPU port

  arch/arm/boot/dts/mt7623.dtsi                 | 12 ++++
  arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 86 ++++++-----------------
  arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 86 ++++++-----------------
  arch/arm/boot/dts/mt7623a.dtsi                | 99 +++++++++++++++++++++++++++
  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 49 +++++++++----
  arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 37 +++++-----
  6 files changed, 207 insertions(+), 162 deletions(-)
