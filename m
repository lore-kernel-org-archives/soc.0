Return-Path: <SRS0=hXuc=NA=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7306C4338F
	for <soc@archiver.kernel.org>; Mon,  9 Aug 2021 12:20:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 813B460F35; Mon,  9 Aug 2021 12:20:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5832660F55;
	Mon,  9 Aug 2021 12:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5832660F55
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id h13so21147017wrp.1;
        Mon, 09 Aug 2021 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=3rCwHQK8SMgm1OR5rvr9CshXBJqUQwBfTUHKUWVeIxY=;
        b=qhe1YYIXtUvcb+6U7NQRrVFv9ofeYaGSOX5GQsi/y3oJHHC7bnUSdlUSdqf8vfP5dW
         T/GQP297a8vVMhgQyBaPTlrcG+2cqF1ljtfibq8b4mAhWP/b9+oepdQqu57t8UQcWruj
         C/aBMGf3SYWiO0WZ1tCPBjPLZTXqkV917REwCS+daYpm4hed7GVJfPs0z/HAlj2nqW8t
         KRH8Y/7tAvFz5cRa8oy3bc4GS6XPoSr08Po/DpRcq658zHPv0sBCEIFYRZ9BWJ0iWFM6
         HOgokeGs8OUeCvKQTgtqTqLxFHdluE5YfOzpMirAOZeeGeFYic3vPpuf+LdNbGaTUH05
         0SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=3rCwHQK8SMgm1OR5rvr9CshXBJqUQwBfTUHKUWVeIxY=;
        b=cD0/8cQw2jk0KoQqvXLO9C8wkGCskOl9eFEUTdObpC9e+/O07dh7Jrfa7I/X+v7YPk
         l1tyu/XC7/s+jJXIPo4CPfBRRtRJaMc97qJNjP+w9g1dtUbKQUDegslQ78oXi2DKqzPv
         H4EoAx7Hjm8HF/rRkoeizW2qKPU5JAcoNvtJtct/K8ZLsS2dzMRs3sW+zO1163Ul9tVB
         nqQIf2XCj0yh8LLL/OrQ8JOqg8SVi2vKXrRL+szl0mmUeq0lZ3MaGiEXM2VD+Jsb9N0M
         C2vpvLSMhS2DgS0/t3BhRyWwMmmCM1a7B5Al//oQ1keoWABUBtqzo52toRy88SqSzBvd
         Va4g==
X-Gm-Message-State: AOAM531cMvQsSqvJsbxrKe/vM7KO9Ora09gAEx07bels5S7xXM41Cd8H
	cLP4PtOaXUzQbMS3qVDMKlo=
X-Google-Smtp-Source: ABdhPJy2R57UaMq6vJfQmeZYQpsWGUQaKaY/Ej8RoEDdffdUzDnY1DVimp+bOsclBVLvu9nQbwVMqA==
X-Received: by 2002:a5d:688e:: with SMTP id h14mr24552655wru.117.1628511605028;
        Mon, 09 Aug 2021 05:20:05 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net. [89.6.132.55])
        by smtp.gmail.com with ESMTPSA id l9sm5122871wrt.95.2021.08.09.05.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 05:20:04 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Frank Wunderlich <frank-w@public-files.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts32 updates for v5.15
Message-ID: <289ded1c-dae7-54ef-6b56-9433bfcaf9de@gmail.com>
Date: Mon, 9 Aug 2021 14:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

Please have a look on the single patch in this pull request for arm32 MediaTek.

Thanks,
Matthias

---
The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.14-next-dts32

for you to fetch changes up to 293cb6b0ea19e628388959da4baa9558e891afc0:

  arm: dts: mt7623: increase passive cooling trip (2021-08-04 19:14:26 +0200)

----------------------------------------------------------------
Increase trip point on MT7623

----------------------------------------------------------------
Frank Wunderlich (1):
      arm: dts: mt7623: increase passive cooling trip

 arch/arm/boot/dts/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
