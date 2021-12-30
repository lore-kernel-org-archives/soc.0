Return-Path: <SRS0=Enm9=RP=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204E9C433F5
	for <soc@archiver.kernel.org>; Thu, 30 Dec 2021 12:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CDEA5C36AEC; Thu, 30 Dec 2021 12:26:22 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CC7AC36AE9;
	Thu, 30 Dec 2021 12:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1CC7AC36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id s1so50230755wrg.1;
        Thu, 30 Dec 2021 04:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=os2YNpsCTezyDUvVaEKZQykhSVtnFd/mykKir30ut1k=;
        b=FX/dhIauRYXd2F10a3c99BkNMmXGf79UrwTWwXzfphwROf9mdTa7AijTU+XM/g+/f7
         Ou5EE4DqQyL50P9+JI6rbK3wnYuDfPE8aoy6eqBVk6AvC+zIeYjaEd01WK2HYz5Mi2ZX
         3C8gx8bBGWxsjSN51xBlplbR/hXVONazcQaZrd1VI9429P3mjPwTJqHgVsTkhwAAEFc3
         SkB7OCDJ3GXRORv2/e+/Tix91Qzk7l7IsYzBZ0Z+QTKMWjAtwlS9V+NJtdex0NnHcM6A
         kbD2pVe3X1m94kjciNaSVTOtN8SrzxtOL4+yiRghdYiKjl19uB+LCG32H1DEEKBQQz5m
         Vq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=os2YNpsCTezyDUvVaEKZQykhSVtnFd/mykKir30ut1k=;
        b=Y/Bj/2OnkCpWEarSwyrd+k4vlrlNapd+hItQ8fTe9wFg6v8ekLI3XctWA2QahFnAcE
         DWTz95mffgH3Oij+gIiLFYP17NWwWLjVumw1FptA81v0gkp74RF5dVUdIj8qIASSg8NU
         teQpfqQgqwLgMTFfC09WLG12iiuWzpXPF2ciqPEaQpvG0jNAAakIyJsoGstISn8g6AFh
         Xp/jbO36LUX3iIZoKoogR3K0B2qYEKt01w0dpDM/0nknE4k+aC5tWNhKExp81AvVy+Jb
         UKY6Z7PDm/HvmdsIQ7iiIBIjfqvhPn43xJQLqS6dMq2R52LNpDfTWI3E470oIoT7AAFq
         2d/Q==
X-Gm-Message-State: AOAM532GpdqZTMDeAF99THl3kmGKOZao3qrEQdCGwdIcgcWNDwXq8X7o
	1CUAW0sAKsO1ecW33GREhUk=
X-Google-Smtp-Source: ABdhPJyUYwvr8oIe6rAz/QlEuguvzFTAQN66WzD9eNWbjK4hIsm5eQxeQzxAdQ1F5KMVvDzVjRgikQ==
X-Received: by 2002:a5d:64ad:: with SMTP id m13mr25346970wrp.714.1640867180321;
        Thu, 30 Dec 2021 04:26:20 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
        by smtp.gmail.com with ESMTPSA id a20sm19257133wmb.27.2021.12.30.04.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 04:26:19 -0800 (PST)
Message-ID: <4e70644b-3c12-1a45-462f-b21294c8d791@gmail.com>
Date: Thu, 30 Dec 2021 13:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [GIT PULL] arm64: dts: updates for v5.17
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, arm-soc <arm@kernel.org>,
 SoC Team <soc@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ben Tseng <ben.tseng@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Sam Shih <sam.shih@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
References: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
 <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
 <9b16c1c9-7fcb-b717-7dcb-b911dd39a5a2@gmail.com>
 <CAK8P3a2mY7y1XWS6L-Ze-DtnhONJRzx0rFdAagBfKGBErsdD6Q@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAK8P3a2mY7y1XWS6L-Ze-DtnhONJRzx0rFdAagBfKGBErsdD6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/12/2021 02:40, Arnd Bergmann wrote:
> On Wed, Dec 29, 2021 at 10:29 AM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>> On 20/12/2021 17:18, Arnd Bergmann wrote:
>>> On Sat, Dec 18, 2021 at 9:42 AM Matthias Brugger <mbrugger@suse.com> wrote:
>>>>
>>>> Please take a look on the below patches for aarch64 based MediaTek boards.
>>>> In this round we add support for the mt8183 based Acer Crhomebook 314, as well
>>>> as we add support to several SKUs for mt8183 based Chromebooks.
>>>> Apart from that we add basic support to the mt7986 in both variants (mt7986a,
>>>> mt7986b). The difference between the both SoCs are the pin-controller capabilities.
>>>>
>>>> Hope you are fine with this pull request.
>>>
>>> I've pulled both tags, but I have two minor comments:
>>>
>>> - please put "mediatek" into the subject, that helps when looking at
>>> the pull requests
>>>     with pwclient, which does not show the author by default
>>>
>>
>> I did this pull request with a lot of time pressure and forgot about it. My
>> apologies, I'll try to not forget next time.
>>
>>> - I was expecting you to send a branch for the new EN7523 SoC as well. Did that
>>>     end up not making it in time?
>>>
>>
>> As I have seen, in the meantime you reviewed some parts yourself. I took the
>> first two patches in my tree, but we should coordinate for the rest. If  you
>> want to take it through the SOC tree or if I should take it through the mediatek
>> tree. As Airoha is a subsidiary of MediaTek, I suppose in the long run, you want
>> it do be part of the Mediatek tree, correct?
> 
> I talked to Felix about it last week, I think it would be best if you handle the
> arch/{arm,arm64}/ bits for Airoha as part of the mach-mediatek and merge
> changes the same way as the mt76xx, mt69xx and mt81xx series. For the
> initial submission, of en7623, having a single branch that contains both
> the arch/* and drivers/* with the appropriate Acks would make the most
> sense, to avoid spreading it out over multiple merge windows, though it's
> not too late for 5.17.
> 

Sounds good. Although it's still not clear to me, if you want to take the 
initial submission or if I should take that.

And I understand that it's a typo and we are too late for 5.17 given that we are 
in v5.16-rc7 already. Anyway I had some comments on the arm bits and we are 
still lacking the Acked-by for the clock driver.

Regards,
Matthias
