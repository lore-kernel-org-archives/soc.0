Return-Path: <SRS0=+Qs5=F6=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193E8CDB474
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 08:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7219C433CD; Mon, 16 Oct 2023 08:02:25 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8AA4C433C7;
	Mon, 16 Oct 2023 08:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8AA4C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so5594594a12.2;
        Mon, 16 Oct 2023 01:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697443343; x=1698048143; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvF2PcqRl9KSZwBr6MB/2HHkdrTa98SVPuAoc53btQU=;
        b=WtBXk+PAtYWqlTFbuc1KIq3j0cxan6ZRk7xwj99qqcIuIcpAEHlC9ZTbksIzNxuUr0
         uwwxTnMr/cv3i3Q0cnVC7h5DwQsQEbqC7TU6Kx6jkR8tc0Q7XyMeHeKZ8AJo/npxgW6n
         4KDCWuJc0Y1x9SdJuIm2FoqLt0rYC0Ow0UZ9ghbEwDUwmnldcPULqDLocD+QOU+EOGxo
         kgPlRAWFmld3Q49MB0E0ugKb35RZ6tHWAE15iLGXr7FVP03AFPhgiZk8rIJbkTIQOPLd
         fbEM8rRzMuj3u8N/awdT6FgSKhpsoCF1ULa6wwupHthXpHOLMuBA5I3bmPvMS8RArrGJ
         bJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697443343; x=1698048143;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvF2PcqRl9KSZwBr6MB/2HHkdrTa98SVPuAoc53btQU=;
        b=gBmLplFKt+nhxQCL4SZiixNMx50Y9Vnjum0UloAw3UEkiau5sMaE/scS5OUotKuorD
         Fs4vQiZX2RHY8w/z5YGnbdEYeFLtUzDY4Q0990/d4rVqNRTeYBE8QDfgb6c0rioFuow3
         /hfCE2p+aqKQhpXpwdWhimboKl15F/CpMul0KnZoRqGwAd+s5FPeF265TkKLr/TnJRRC
         Npx8whLOS7SxWv/dOSoyM8w8gHMDvpKrqtOj6WE/3I2O6ikqpQLwOholCK+FaIARgbOP
         vT6JpO/qu0hCxPOx8oUoc4LciyQJKC7z2MX4YRiPn8Uf0Hbxjd/m8soZ8jCWFT/ZAVWv
         sbJw==
X-Gm-Message-State: AOJu0YxvEf26TAMsbVPeQiw30dSsfILlczX7v17bFLl8+pSwA4Gnx8lT
	gXs5FeA9na+VsOUQsUwfgUQ=
X-Google-Smtp-Source: AGHT+IElTsjn90fwq4hatmt/dgv1pYY/XJlmk6y+MMUK7RR8JqCX9MwWGnjQLP+uu5RVV+AOlO0f2Q==
X-Received: by 2002:a05:6402:5192:b0:53e:2b80:2f74 with SMTP id q18-20020a056402519200b0053e2b802f74mr9645102edd.0.1697443342650;
        Mon, 16 Oct 2023 01:02:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id u26-20020a50951a000000b0053ecef8786asm1190691eda.75.2023.10.16.01.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 01:02:21 -0700 (PDT)
Message-ID: <a2cbe324-9226-1d9d-2e7f-3ce7fcb706a0@gmail.com>
Date: Mon, 16 Oct 2023 10:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
 <ae62c7e0-3e72-403c-abb4-569573037980@app.fastmail.com>
 <aca26ff7-801c-65ad-0cc2-fef8a4f74e27@gmail.com>
In-Reply-To: <aca26ff7-801c-65ad-0cc2-fef8a4f74e27@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd,

please find below the new tag, based on v6.6-rc3 this time, sorry for the mess.
Please let me know if you need that in a separate patch or not. I'll no go 
forward and delete the old tag.

Regards,
Matthias

---

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

   Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.6-next-dts64.2

for you to fetch changes up to 976868a021ee654f4cf6eb6a2f40f95c78c04093:

   arm64: dts: mediatek: cherry: Configure eDP and internal display (2023-10-16 
09:55:08 +0200)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.7

- Add support for SMI/IOMMU/LARBs, power domains and multimedia
   related subsystems for the MT8365 SoC
- Add support for MediaTek Genio 1200 IoT evaluation board
- Add support for newer revisions of MT8192 Chromebooks
- Add support for internal eDP display on MT8195 Cherry Chromebooks
- Add display and display backlight support for the Helio X10 SoC and
   for the Sony Xperia M5 smartphone

----------------------------------------------------------------
Alexandre Mergnat (7):
       arm64: dts: mediatek: add mmsys support for mt8365 SoC
       arm64: dts: mediatek: add camsys support for mt8365 SoC
       arm64: dts: mediatek: add apu support for mt8365 SoC
       arm64: dts: mediatek: add power domain support for mt8365 SoC
       arm64: dts: mediatek: add smi support for mt8365 SoC
       arm64: dts: mediatek: add larb support for mt8365 SoC
       arm64: dts: mediatek: add iommu support for mt8365 SoC

AngeloGioacchino Del Regno (4):
       arm64: dts: mediatek: mt6795: Add support for display blocks and DPI/DSI
       arm64: dts: mediatek: mt6795-xperia-m5: Add display backlight support
       arm64: dts: mediatek: mt6795-xperia-m5: Add DSI Display and its vregs
       arm64: dts: mediatek: cherry: Configure eDP and internal display

Chen-Yu Tsai (1):
       arm64: dts: mediatek: mt8183-kukui: Add PMIC regulator supplies

Macpaul Lin (2):
       dt-bindings: arm64: mediatek: add mt8395-evk board
       arm64: dts: mediatek: add device-tree for Genio 1200 EVK board

Nícolas F. R. A. Prado (5):
       dt-bindings: arm64: dts: mediatek: Add rev5-sku2 of hayato
       dt-bindings: arm64: dts: mediatek: Add rev4 of spherion
       arm64: dts: mediatek: Remove asurada-audio dtsi files
       arm64: dts: mediatek: Add hayato-rev5-sku2
       arm64: dts: mediatek: Add spherion-rev4

  .../devicetree/bindings/arm/mediatek.yaml          |  16 +
  arch/arm64/boot/dts/mediatek/Makefile              |   3 +
  .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 101 +++
  arch/arm64/boot/dts/mediatek/mt6795.dtsi           | 253 +++++-
  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  28 +
  .../mt8192-asurada-audio-rt1015p-rt5682.dtsi       |  19 -
  .../dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi |  26 -
  .../dts/mediatek/mt8192-asurada-audio-rt5682.dtsi  |  21 -
  .../boot/dts/mediatek/mt8192-asurada-hayato-r1.dts |  19 +-
  .../dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts |  64 ++
  .../dts/mediatek/mt8192-asurada-spherion-r0.dts    |  19 +-
  .../dts/mediatek/mt8192-asurada-spherion-r4.dts    |  77 ++
  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |  28 +
  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |  33 +
  arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 210 +++++
  .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 901 +++++++++++++++++++++
  16 files changed, 1749 insertions(+), 69 deletions(-)
  delete mode 100644 
arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p-rt5682.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt1015p.dtsi
  delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-audio-rt5682.dtsi
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts
  create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts

On 16/10/2023 09:52, Matthias Brugger wrote:
> Hi Arnd,
> 
> On 13/10/2023 22:40, Arnd Bergmann wrote:
>> On Mon, Oct 9, 2023, at 12:34, Matthias Brugger wrote:
>>> Hi Arnd and Olof,
>>>
>>> Please find below a few patches for the 64 bit DTS files targeted for v6.7.
>>>
>>> The patches were picked up with the help from Angelo.
>>> With these changes we have now support for the Genio 1200 EVK board for IoT
>>> applications. Also the MT8365 from the same business line has much more support
>>> of peripherals.
>>> Also support for the new 4th revision of the Acer Chromebook 514 was added. The
>>> difference with older board is the audio codec used.
>>> On the Mobile phone side of things, support for the Helio X10, which is used by
>>> the Sony Xperia M5 got support for the display.
>>
>> Hi Matthias,
>>
>> The contents all look good and I'm happy to merge them, but I noticed that
>> the branch is based on -rc4, while my soc/dt branch is based on -rc3.
>>
>> Pulling it in would slightly mess up the git history and the 'git request-pull'
>> output because of the backmerge of the mainline contents. Do you
>> have a hard dependency on something that went into rc4, or can you
>> rebase the branch to -rc3 or earlier?
>>
>> I usually recommend using -rc1 as a base unless there is an important
>> dependency on something that was merged later.
>>
> 
> AFAIK ther is no dependency on -rc4. I'll send a new pull request based on the 
> correct -rc3
> 
> Sorry for that.
> 
> Regards,
> Matthias
