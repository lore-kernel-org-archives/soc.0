Return-Path: <SRS0=DVzh=RO=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1DFC433EF
	for <soc@archiver.kernel.org>; Wed, 29 Dec 2021 15:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A794EC36AEC; Wed, 29 Dec 2021 15:34:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C91BBC36AE7;
	Wed, 29 Dec 2021 15:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C91BBC36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id a9so45066341wrr.8;
        Wed, 29 Dec 2021 07:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WYr35naI3hcDek70Q9WmEYk39oeQb3bTtyy8jRSZRMg=;
        b=CsUCt033ScNlqI8qnWMAo032e43J/hYsrt5/Dr5cMalmTKyaaVzE9RdxURfnmH9Xwl
         0FAZ4KPXBbbwtG2hkNvXZGqa2GncCNOfRd6e4u8u2j2JDpuCpQ2z1HCLhQdD/+RIKRcK
         5fuEGlR8BIPNtwg2IgxHrPTUVVTUpPdKWzMkYQoPduuSBKTeFPKK28Y5sPHSUYlTGBCi
         MggLztuJviQnYGVUd2BPgIOQzzDvwHXjukmOvUUBwQ7tE8wxomXHtIz1UhIUYH+/8Ds5
         unJ886dvqKNEncURnoxGO1P/qfxNW294uheELPlvMOzfjvIpOlvBJbVUVmLA4s3aMlIF
         Faiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WYr35naI3hcDek70Q9WmEYk39oeQb3bTtyy8jRSZRMg=;
        b=o+zFETDHvtbL4fOANRyWhrEDITwwuV2Nd8nmiVsman9HGWdtvOPKqTafe0sU/PVW9n
         uSAhqlP7qlNVb9fh6Co+azopvzthexMbyISuG4k8hTOvaohoZFbW0E5f4NPEITFuKIBC
         FUJffKtZkgmcoBNRiBTTYmnzEbe6461cKn07NCYXevslrldT3Qu+yPR53bNOP3HxuXMS
         HyAR8xqh/hER6QO91JYOKrpR7D3IoXCdCIgNr0fvifstSTsC4ZhTStK0fjYo+KbqXDpi
         B04fxpJLUYGSZ9zMCguOL1JEBIDe9bGm4XqRPPw0zox7qDURy4To6f5Q9/GAAC/rySVc
         FNvg==
X-Gm-Message-State: AOAM530W0uRG3wYHiDo2KBsrFGmqfVKm1TPwVzlSwGZIhMf2GqeuvTcZ
	a466eaMktM40eXcdt3ZetLs=
X-Google-Smtp-Source: ABdhPJzR7W1Kcy+/Au2+qJS9Ipa/1Z1BmQh+8UXdbyDF0Tq8MQhNpDDVMosskN43on2rB0JNm0gQ6Q==
X-Received: by 2002:a05:6000:18ae:: with SMTP id b14mr20303107wri.358.1640792088063;
        Wed, 29 Dec 2021 07:34:48 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
        by smtp.gmail.com with ESMTPSA id s10sm22047103wmr.30.2021.12.29.07.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 07:34:47 -0800 (PST)
Message-ID: <9b16c1c9-7fcb-b717-7dcb-b911dd39a5a2@gmail.com>
Date: Wed, 29 Dec 2021 16:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [GIT PULL] arm64: dts: updates for v5.17
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <mbrugger@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ben Tseng <ben.tseng@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Sam Shih <sam.shih@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
References: <0d05e8b6-c56f-bad7-00c1-44682cedb38f@suse.com>
 <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAK8P3a1DaHnf0QOMjuvTYGeUttUNkBLhFu0b-43jBAa0bHtLFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 20/12/2021 17:18, Arnd Bergmann wrote:
> On Sat, Dec 18, 2021 at 9:42 AM Matthias Brugger <mbrugger@suse.com> wrote:
>>
>> Hi Arnd and Olof,
>>
>> Please take a look on the below patches for aarch64 based MediaTek boards.
>> In this round we add support for the mt8183 based Acer Crhomebook 314, as well
>> as we add support to several SKUs for mt8183 based Chromebooks.
>> Apart from that we add basic support to the mt7986 in both variants (mt7986a,
>> mt7986b). The difference between the both SoCs are the pin-controller capabilities.
>>
>> Hope you are fine with this pull request.
> 
> I've pulled both tags, but I have two minor comments:
> 
> - please put "mediatek" into the subject, that helps when looking at
> the pull requests
>    with pwclient, which does not show the author by default
> 

I did this pull request with a lot of time pressure and forgot about it. My 
apologies, I'll try to not forget next time.

> - I was expecting you to send a branch for the new EN7523 SoC as well. Did that
>    end up not making it in time?
> 

As I have seen, in the meantime you reviewed some parts yourself. I took the 
first two patches in my tree, but we should coordinate for the rest. If  you 
want to take it through the SOC tree or if I should take it through the mediatek 
tree. As Airoha is a subsidiary of MediaTek, I suppose in the long run, you want 
it do be part of the Mediatek tree, correct?

Regards,
Matthias
