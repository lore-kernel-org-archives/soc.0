Return-Path: <SRS0=c+if=RA=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F566C433EF
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 17:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9C7DC36AE4; Wed, 15 Dec 2021 17:20:17 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52C7AC36AE2;
	Wed, 15 Dec 2021 17:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52C7AC36AE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id p13so21297598pfw.2;
        Wed, 15 Dec 2021 09:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GleY9ZpmMktJjEGF86wutMfqGzM2DTjPwIbySqApyu8=;
        b=nmAsWIOgXqk02SYJQaTEg73biPz2sZ/DoXGxWtrrXhAmeKTfJTzV6A9e9QeTIW8+c9
         wFS4lkmha6eLxpuYIqdBc4WOt6rzlBEleMaF8KlRMG4V0Itdqg6j3OJyZ1IlEzD8v6/z
         vUe2Sgtk3ZIezkm9j6m0Uj2qIACDGAD1Vne56X9B+zF1tr/LAAMlY4et4vwzv6e224ZM
         bTRMrmBcbKpnk+c2tqxbgNa771pRrA7KAXK59ndzPvOJGJnpkVZqhYzvBXR7KRHiT0z5
         KDWCWWFqXVYKliiy7cDzMTdISDqwBjAFdKsIVJEVWtFpyfGenu3+e37vIe2rp8VVkiUv
         C5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GleY9ZpmMktJjEGF86wutMfqGzM2DTjPwIbySqApyu8=;
        b=HioqMTANFaPaeYVFEA1cYCmjIsQTrXdTAZLrjGi5u6Rb7mWO3RSSYVBCUsoOY1O5dV
         aisxZXuiaFFfwCAl1BOvJZ3Z6bLqbP/fbo7idxmIspZV2EqNT+OacJzx0IraTUgO76QO
         tK8fyh0I3lo0LU687ZOoyBUHr2thnRxWkImrLmxL+qD1qYksBQGUmWVJtKOqBjL4P/jM
         cVhX63RoD1dChqhfi8T0iiSCAEO9TqUc3s0lxRqiMIltOqyrvYHOqVa6SIfIxoCPnwwc
         iWTpdoRW3Yes5mdKn56nQXdi+ZWCBWdlnUWh1Tsp+XWU9tHOL24QW7z7xezNnSvBYK60
         JX9w==
X-Gm-Message-State: AOAM533AJv3Li7d1gLM3ih19VCeJC8zx6bOM9rSD2rjs1vNFYirAxlOI
	1SaCxvunfw6DZH4/1JD9oJo=
X-Google-Smtp-Source: ABdhPJzlE9Cx5+3+M7ivMSO/iDS3pnS6K6lxSYyXEjZPoDIbEdG8/4VPtzoiN5y5GEzFLTMJVRT2og==
X-Received: by 2002:a63:e56:: with SMTP id 22mr8365075pgo.581.1639588816858;
        Wed, 15 Dec 2021 09:20:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-148bb55d3adsm452145ad.221.2021.12.15.09.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 09:20:15 -0800 (PST)
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 5.16
To: Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Phil Elwell <phil@raspberrypi.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
References: <20211214033617.2979148-1-f.fainelli@gmail.com>
 <e7f3edb9-4691-2136-7884-b7bea2ac892c@gmail.com>
 <CAK8P3a3TkCRSfy=0ogn-+cXB-o0YoJKmYNwnmXeGdZoxjGCOYA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <fbc65d98-416f-71d4-d7ce-958c3ee99f6b@gmail.com>
Date: Wed, 15 Dec 2021 09:20:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3TkCRSfy=0ogn-+cXB-o0YoJKmYNwnmXeGdZoxjGCOYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/14/21 10:59 AM, Arnd Bergmann wrote:
> On Tue, Dec 14, 2021 at 6:13 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>> On 12/13/21 7:36 PM, Florian Fainelli wrote:
>>> Florian Fainelli (1):
>>>       Merge tag 'tags/bcm2835-dt-fixes-2021-12-13' into devicetree/fixes
>>>
>>> Phil Elwell (2):
>>>       ARM: dts: bcm2711-rpi-400: Fix GPIO expander labels
>>>       ARM: dts: gpio-ranges property is now required
>>
>> It looks like the change above needs to be accompanied by
>> pinctlr-bcm2835.c changes which have been applied into Linus W's tree.
>> Arnd, are you able to back out this pull request for the time being? I
>> don't believe any of those fixes are critical for v5.16.
> 
> I was already holding off because of a comment I had on the vchiq patch,
> as discussed on IRC. I assumed you had already seen the discussion there,
> so I did not reply here.

Thanks, I dropped this from my tree as well now. We will get those fixes
merged in a slightly different way to avoid breakage in linux-next. Thanks!
-- 
Florian
