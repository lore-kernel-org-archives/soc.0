Return-Path: <SRS0=zSrM=FN=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26862C433FE
	for <soc@archiver.kernel.org>; Wed,  9 Dec 2020 18:06:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E401D23C8F; Wed,  9 Dec 2020 18:06:36 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBB1D22BF5
	for <soc@kernel.org>; Wed,  9 Dec 2020 18:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBB1D22BF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=monstr@monstr.eu
Received: by mail-ej1-f41.google.com with SMTP id x16so3444580ejj.7
        for <soc@kernel.org>; Wed, 09 Dec 2020 10:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RjFz5f8bSsVQx+KMHcKw1foSB9wAMPFiUfU9x7eJwoo=;
        b=0zsks3ExhtjFuX+6LbbCPnyeBp/ugyMsPMaYg8YSNjcL+RWWjyWZtIh2S2Bafl9N1j
         znUaFLCbX8KnXFeHk+EHWjyCsPEAbK03kFjIapX20t64jFsWOM6JicsX5ydF/uvi3CA3
         RgwWU0LYNq2Fh3asVkpL/W4IhIgTXk8ezGcsXO0cPKaOGoiXW7Uf5py6bWbcl7uyRYzD
         6VUXLYc6qeF9D0n/rSVG6e2eNP3p9mVfVs/SZJiXr50fXAAj2Ss651s3vIisn7XWqRDa
         dgfrQNhe3f/chL3mowWhBDOvOizIjzjq4YkNXUAGagXom5RvGj9jeA8sSthcpe72EY5t
         pz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RjFz5f8bSsVQx+KMHcKw1foSB9wAMPFiUfU9x7eJwoo=;
        b=udR8NeygWRIOLJMOXyRPLKb04uyVEVrwR1EHScbTJ4x19ZleLkOqgphDcjm3CqeXse
         yIFAh9BU7GhbGJliyopxF6O+HwGCdDwQzK1J6HryfVBcGbyfIJbxJ2d2SdJrJMxd2SQV
         XvLCYNDsQne1e2OKcMlj6HnX9D1lFG31ODhvehIru2Pd/wRVCtLAGCRB+/GQkGak/Ldl
         wVZhiTJ9M4tnGxkaRdSJCiFo8gyFkESmgtRTCpC825XM9lTJEIeVci9yM0F12sJzCmfo
         O7GS9uWkqs5ZCpTnXesSzMc+5v/VC0VvCLNNSD9XHtFoDtHLBPZpZsMLRWX3aZYNylVW
         RRYg==
X-Gm-Message-State: AOAM533GXMGtwRWYE0OIzY/WLveLqHt5J33lvUkR0e+T8CJ0MUiNFWzU
	vFp+vcgKSnALxmWpsQoM9FrGfdsxsW529SL1
X-Google-Smtp-Source: ABdhPJyfCri8fPG+JQJbVhxBdO9YUBouZjnBkehdYMcP4vzun3XUa/7RRGGncA9gW/1WlpVUMP9RIg==
X-Received: by 2002:a17:907:2111:: with SMTP id qn17mr2979879ejb.525.1607537193800;
        Wed, 09 Dec 2020 10:06:33 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id w17sm2408269edu.90.2020.12.09.10.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 10:06:32 -0800 (PST)
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 arm-soc <arm@kernel.org>
References: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
 <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <ee069c7c-c86d-2fa7-ab44-243483fdf108@monstr.eu>
Date: Wed, 9 Dec 2020 19:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 09. 12. 20 18:01, Arnd Bergmann wrote:
> On Wed, Dec 9, 2020 at 3:51 PM Michal Simek <monstr@monstr.eu> wrote:
>>
>> Hi,
>>
>> please pull the following changes to your tree. The tree is based on
>> zynqmp-soc-fixes-for-v5.10-rc6 tag or acfdd18591ea ("firmware: xilinx:
>> Use hash-table for api feature check") which went to v5.10-rc6.
> 
> Is it necessary that this is based on top of the bugfix? This means
> I'd have to do a backmerged of -rc4 into my dt tree, which is something
> I would prefer to avoid.

The patch from Zou Wei is fixing the hash table patch merge in rc6.
If you think I should drop it and send it after rc1 I am fine with it.
Just let me know which way you prefer.

> 
> I also notice that the subject is the same as the DT pull request, which
> seems to have messed up patchwork into thinking it is an updated
> version of the former.  If I had not noticed the backmerge, the DT pull
> request would have gotten lost.

I shoot an email that subject was wrong. It is targeting soc tree.
Sorry about it. Let's figured it out the first part about RC and then I
can send new PR with proper subject.

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

