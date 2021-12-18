Return-Path: <SRS0=ueIg=RD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFCEC433EF
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 08:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F37DC36AE8; Sat, 18 Dec 2021 08:45:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F19B2C36AE5;
	Sat, 18 Dec 2021 08:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F19B2C36AE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id v11so8460845wrw.10;
        Sat, 18 Dec 2021 00:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=06eLN17oGEhjR34hvwbzQG7R8lpfia5AJHcAmwtgiFA=;
        b=FbFIE8c2T6OguLgnommh44XgNoM9ji/ULVszq4DKZ1AjZSikgpRQTREep/av4FG36x
         8eCkwRVM6vIwen9n6ViiQv2yArACv4nUvX4F+7ONGhlKb0wkYEDAtJLtfL+kkpjF43fP
         /38t9rkYKlNW8OEhEFliXr0ryrGmy8KVc6wdFtAJeaDb6QachI1znrcFNBA91nahpUhc
         uNkkoV2ZQczH7BW6OKmluTL0GcMfFCIPMA609Me4D5vwyv2rMRPjwocl5dPFLlwG9BNq
         thH0Bs6SFMbdtfiOQeISZftxyboI9rLcWvc2JPgK9wxHHb7lYUg6H4x1j/9VFrgfVS0I
         tP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=06eLN17oGEhjR34hvwbzQG7R8lpfia5AJHcAmwtgiFA=;
        b=Mh8PE4T87G3u34CzQdic3wzJsLFiUZpAAJCoqgNk3ZB6xkSrvBT6mGyVJE4BFlMO05
         XL1xPcXgMjhShW5K2+s0+Izmam+VRNEvxF+NFCdAd3Jg+aQPMUMuuqQwQoPl7SzMCgf9
         d6Wvaf4x6EB44RBJTmjy+DF0yTpziSdNXrcL00cx2JfgVU5g0VM0xFQf6N07Vi6abW6e
         SocOnA/klbfpHPYdO4Hj0hQoDkE7+6BIfwd/MuzFaGpYy06phFQ5yPHkgCSldDxAyxEG
         Zf6LFtVfmLYBA+BKeEqCWqdUfApOEIRiuxW/K2UEwsbx9HL03h749kWnMzxJeLTAK6FC
         xnZA==
X-Gm-Message-State: AOAM533dc3ti4NvAinpkY8/kgoE8Gic6bagGcaae05mLP4ZKKGddKXyh
	LedO6XnQ9P3yqYFp4/QIyw8J4LHeNdQ=
X-Google-Smtp-Source: ABdhPJyJa4OvOo0OMslCtmRd3ytAtEcRpW64uX3qBhtjA+EZyhW/RugxJNaxRIcHITn+qdPca27xzA==
X-Received: by 2002:adf:e545:: with SMTP id z5mr3601221wrm.211.1639817105302;
        Sat, 18 Dec 2021 00:45:05 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
        by smtp.gmail.com with ESMTPSA id n1sm11751822wrc.54.2021.12.18.00.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Dec 2021 00:45:05 -0800 (PST)
Message-ID: <9ea1efa3-492b-7204-58f8-5253cd5b05f9@gmail.com>
Date: Sat, 18 Dec 2021 09:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Luca Weiss <luca@z3ntu.xyz>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dt32s: updates for v5.17
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Please have a look on the 32 bit arm DT changes.

This time there isn't too much. We add basic support for the Fairphone 1. 
Hoepfulfy in the near future we will see more HW support on this rather old SoC.

Regards,
Matthias

---

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.16-next-dts32

for you to fetch changes up to aa67bacb482ae66bdb18b78ddccf7b9180441588:

   arm: dts: mt6589: Add device tree for Fairphone 1 (2021-11-15 17:41:21 +0100)

----------------------------------------------------------------
- add device tree for Fairphone 1 (mt6589)

----------------------------------------------------------------
Luca Weiss (1):
       arm: dts: mt6589: Add device tree for Fairphone 1

  arch/arm/boot/dts/Makefile                 |  1 +
  arch/arm/boot/dts/mt6589-fairphone-fp1.dts | 30 ++++++++++++++++++++++++++++++
  arch/arm/boot/dts/mt6589.dtsi              |  2 +-
  3 files changed, 32 insertions(+), 1 deletion(-)
  create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts
