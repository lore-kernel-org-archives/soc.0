Return-Path: <SRS0=+qiu=PC=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA8AC433F5
	for <soc@archiver.kernel.org>; Thu, 14 Oct 2021 09:26:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 62CE561108; Thu, 14 Oct 2021 09:26:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3869E610D2;
	Thu, 14 Oct 2021 09:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3869E610D2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id y3so17451716wrl.1;
        Thu, 14 Oct 2021 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=snfOBT2Y32E/2SaHG65K+s5HBFNed3uLDzrXbLPDkkU=;
        b=e3fd5m61Xys/SwuLvhUq+kKDvP4Yq3z6Mx+wgOTweU2UzJe7t9Dtu9td/2VWPGw11l
         6MIyGmNEC2/V5XNIjtfHmVKCcXdYVby04Qni8Pfe+DBad+BeklL5v2rIYKnKkzsX7K51
         7f1xuH4w4c9sl8ytNgr003JAq5+9NwkKk5IlTMEzVSwGZZTwSROmn3pAktMDENiGtEgR
         iqZ6+HnKoL9qDS+fwGBT+HQ7HXsYPBzCoFqdVYpnMDXmEIJY5dOcllJrwAxDN86FWEcq
         lJwD1gCzkQfkYRzvHv84P/PCH23/Z0Uoex1dtjdlpdTSqksaah5vh7K3KpkfV+d88c/j
         rbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=snfOBT2Y32E/2SaHG65K+s5HBFNed3uLDzrXbLPDkkU=;
        b=Ii99/tbhDfcc8m1UUueVQenqNN7Wm+j1dvn0VBOLj8bfWE/OwHHodbViE8I4jybnDQ
         aNVo5juKCkhgogT1kyvqGiCiy8YfNN9CPAKLs8Efyn3Zwz2PeJmiSfXP2gijOFdiFmKA
         mmA2Qcr37imNo+iw8+3EKkbeFrkTIEdggLJ/CB3IUl4InfPkJllt2Bofitbra/2O6LEh
         24nphpMZ4BaxhtdOoxLP414nJRRei+oCUSwRC40W+MGWib//RMJxgxe4nC3OehbN2eKJ
         nlTQZi2yOjO5z5G+UPfaNjmBXAOjmKUh/Hbj/iyxGNIP0cVBHyRaL4mWeELZIyTwdP47
         q7Ag==
X-Gm-Message-State: AOAM531lSTbvcHqsr232Q0IFFxbLxCpTUBuqUzUwovAPRkYoYUtmx8v4
	jzcOIHdFfhQ77VjG94ftAF4=
X-Google-Smtp-Source: ABdhPJyqplZlUjr+rcowDy1Ll1m3D6XCjhzt/+I3QHynf7iACzDNtZWsAWL488SjsJLQrdi2VljUpQ==
X-Received: by 2002:adf:b355:: with SMTP id k21mr5330494wrd.380.1634203582679;
        Thu, 14 Oct 2021 02:26:22 -0700 (PDT)
Received: from ?IPV6:2620:113:80c0:8000:c::779? (nat0.nue.suse.com. [2001:67c:2178:4000::1111])
        by smtp.gmail.com with ESMTPSA id f18sm1865739wrg.3.2021.10.14.02.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 02:26:22 -0700 (PDT)
Message-ID: <93377766-a1b9-ee29-f874-ebf0e2bf3a8a@gmail.com>
Date: Thu, 14 Oct 2021 11:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [GIT PULL] arm64: dts64: mediatek updates for v5.16
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Kansho Nishida <kansho@chromium.org>
References: <1a3d63a3-c020-3319-26f6-a2ec338cc42e@gmail.com>
 <CAK8P3a06SKo+Y+DiFpozrO0R+67ht1ad6U9dyTa-M9TtD73VcQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAK8P3a06SKo+Y+DiFpozrO0R+67ht1ad6U9dyTa-M9TtD73VcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/2021 22:34, Arnd Bergmann wrote:
> On Mon, Oct 11, 2021 at 11:58 AM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>> Hi Arnd and Olof,
>>
>> Here come the latest updates for arm64 DTS cahgnes.
>> Biggest change is, that we have now support for a reset controller inside the
>> mmsys. This goes inhand with changes to the driver, that you will find in the
>> soc pull request.
>>
>>
>>     arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0 (2021-10-08
>> 15:11:14 +0200)
>>
>> ----------------------------------------------------------------
>> - mt8173: add reset for dsi0 to mmsys
>> - move dt-bindings reset controller includes to correct folder
>> - split PCIe node to use new format for mt2712 and mt7622
>> - mt8183: add audio node to chromebook devices
>> - mt8192: add clock controller node
> 
> I skipped this one for now, need some clarification. The PCIe node
> looks like you are doing an incompatible change to the DT binding,
> but that is something that should be explained in the tag description
> or (ideally) avoided if at all possible.
> 

Mediatek PCI device tree binding described the root port in a wrong. The IP 
actaully implements several root complex with everyone having a single root port.

We need to fix the DT in an incompatible way to describe the HW as it is. This 
also fixes a problem that no IRQ bigger then 32 could be handled.

The only public available HW that is affected by this is the BananaPi R64. I'm 
not aware that there is a big user base using the upstream kernel. In this 
boards PCI is only used for extension cards, so I don't expect any boot problems.

> Did I misread that patch, or did you forget about it here?
> 
> On a related note, the tag description should better have full
> sentences like your introductory text above it, that makes for
> a better changelog text in the end. Enumerating all the changes
> is not helpful here because the list of commits is also part of
> the changeset description after I commit it.
> 

Got it, I'll write a full sentence description I use to do for the pull request 
emails in the tag.

Regards,
Matthias
