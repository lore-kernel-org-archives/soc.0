Return-Path: <SRS0=vtH0=HD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589BFC433E0
	for <soc@archiver.kernel.org>; Mon,  1 Feb 2021 08:50:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1E9F164E3F; Mon,  1 Feb 2021 08:50:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91AC364E31;
	Mon,  1 Feb 2021 08:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91AC364E31
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-wm1-f53.google.com with SMTP id a16so733688wmm.0;
        Mon, 01 Feb 2021 00:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rIiV2l/8Qf1juG7z36n1KVoCTNYEzigbbx8ySlcRFIU=;
        b=qpwS4+w0No/kjqi9pPJi0b1UkW42lwpu9GiFvxw5B5qU8wh1TT4PzZOFNDpV9x0aMB
         559Kf9cmqogMtj/58X+kijNdaqWOrLanYVn7vOKPJR+6NMGAp+UDs5yjnIOxA8ZbHom8
         K+S4th4Ji8cxYidORiMybefEIwPFmaW1sWNSBBOeOkbRQOJGBdbAMYnIr1fHpb8SojfV
         oDCBSmWrgxZ3USTPdliDl16vLjnQCKaBnLZDW4aQMkTfabhI8rTbZgk5pHszFLVnFoEx
         b2RivGZucjjOGAl3nYOd6XdNBnRpZoyt8Z2+neh1jBYCDvbcACDgJwUrOh1J4GoQkfM8
         eKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rIiV2l/8Qf1juG7z36n1KVoCTNYEzigbbx8ySlcRFIU=;
        b=bRamKVcO6LqZ/RIL+a/3IswBcBpI8Quw8dLPNAkezGkSH1SxtUgRisgDnpfxMMs6nF
         G2kAiUbBeKHuKSEH6n2qCEOzIE4RWR8+DhCbBtxzcocMhu8H2e91uh0eXuHqqiN4/QWN
         iIiuyoMDaUjHNX/STZn5jdeEWtAw+4zpFNWfi3qAmkXiIDWLSKETGDNcD4DMgr5bXjVi
         aXBUVtusybPPvMl2+tIuAlVgh7l9mQGAy8TCVeWU2QfBJUdOknlqqnHjOy+hc2wkaTWB
         tcZmtfWwnbDf3B1AANJH4Z09JQHfOy54jS4wKuB4FgsRmh9d9CfiI4k1DhG4p22cblJF
         NUnA==
X-Gm-Message-State: AOAM531p58T5tOCEaVks+IK57l8DvIiyfeBosPeP4eeJNeZn3aUE7ffj
	bCs1A4ryxAcPM9gBiDHNRro=
X-Google-Smtp-Source: ABdhPJwMG9i1Sej5MLrrFago+IjOeLAh/IFRWk11NBhciLuq+1qoY42wMuzwOISDhylXSmgSrk7Few==
X-Received: by 2002:a1c:408a:: with SMTP id n132mr5037245wma.86.1612169445107;
        Mon, 01 Feb 2021 00:50:45 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id i7sm15842882wmq.2.2021.02.01.00.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 00:50:44 -0800 (PST)
Subject: Re: [PATCH v1 2/2] arm64: configs: Support DEVAPC on MediaTek
 platforms
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Neal Liu <neal.liu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 SoC Team <soc@kernel.org>, DTML <devicetree@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Hanks Chen <Hanks.Chen@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Jackson-kt Chang <Jackson-kt.Chang@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
 <1608713092-26952-3-git-send-email-neal.liu@mediatek.com>
 <68442164-d649-aee0-cfe8-c9ebb868612d@gmail.com>
 <CAK8P3a1DLX6y5GM3O7+T0gMH_JLRp6nUkHFZc4Shjn_bTKWWSw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7001eef4-42bd-0c17-50a3-4d619d0fc80a@gmail.com>
Date: Mon, 1 Feb 2021 09:50:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1DLX6y5GM3O7+T0gMH_JLRp6nUkHFZc4Shjn_bTKWWSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 31/01/2021 23:23, Arnd Bergmann wrote:
> On Sun, Jan 31, 2021 at 3:07 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>> On 23/12/2020 09:44, Neal Liu wrote:
>>> Support DEVAPC on MediaTek platforms by enabling CONFIG_MTK_DEVAPC.
>>>
>>> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
>>> ---
>>>  arch/arm64/configs/defconfig |    1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index 17a2df6..a373776 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -257,6 +257,7 @@ CONFIG_MTD_NAND_MARVELL=y
>>>  CONFIG_MTD_NAND_FSL_IFC=y
>>>  CONFIG_MTD_NAND_QCOM=y
>>>  CONFIG_MTD_SPI_NOR=y
>>> +CONFIG_MTK_DEVAPC=m
>>>  CONFIG_SPI_CADENCE_QUADSPI=y
>>>  CONFIG_BLK_DEV_LOOP=y
>>>  CONFIG_BLK_DEV_NBD=m
>>>
>>
>> From my understanding, defconfig is for a minimal config that allows to boot a
>> machine. As MTK_DEVAPC is a rather exotic driver to detect bus access
>> violations, I think it's not a good candidate for inclusion in defconfig.
>>
>> In any case, I added the SoC maintainer, so that they can correct me, if I'm
>> wrong :)
> 
> I generally don't mind adding platform specific drivers as loadable modules
> even if they are somewhat obscure. For built-in drivers, this is
> different though,
> as those have a noticeable impact on other platforms.
> 
> I haven't kept track of what this particular driver does, but from the Kconfig
> description, I'd say it should get enabled in defconfig.
> 

Thanks for the feedback Arnd.
Applied now to v5.11-next/defconfig
