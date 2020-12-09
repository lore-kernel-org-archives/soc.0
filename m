Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D959BC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 18:08:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC9923C8E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 18:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC9923C8E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JESM9XU8ausJztysb7J5LBj6K0c9etQ6LnFAKXREfHE=; b=0PYB5LLBkOw3TW/ORY6+hF2j2
	r0pKzU/ExAd9urS7SmgFzKuYa0pSIMBZ07XN03p5oM1NeoI998q/CuB/Sk3G6a1NjjVkIbwg2B3zG
	0UXgerLK16IO/wJoWwDkvreXntV5OOgg5vRwnBwaXOU2t8IOV5G3n/pNfyGKuRAIJhO3c/2Up5sha
	Hj5m7cohYuMgePl5lVmQRHUWdIkeoNqxWb49rg6wACnZo8kr/xB2zovGFXsAnRAy42HXlGZ3Hnu/D
	oU3jr/qLIeWPPbqxu0k+mnRSU4TU5ezjxXlYcxwNnkBbtdaUO1wbGhWW6aYv73DhO6tGrgi2qlfjo
	aMgVw8rKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn3rO-00040e-U2; Wed, 09 Dec 2020 18:06:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn3rK-000408-KJ
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 18:06:41 +0000
Received: by mail-ej1-x62b.google.com with SMTP id ga15so3460091ejb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 09 Dec 2020 10:06:34 -0800 (PST)
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
 b=ROMLBnj74mpeQ/7WAI3DOFXl4zC09Dq/debgwRsYws7KIaLqBtTTuAMUohQfgcHnvV
 kvKa+iNl8RlyXoGW+dAiFmsdleQjkrgWDipERtKXEI8n3KwrGP76nYSg0yGyWcNLdD+g
 7E7FUmeJkRuTjDWGXWv1dCAv7AL3oUgh6+5WXXZ1UNbEIEgUE7HsNI6JHkWJ6G9H/sxe
 iOGhngH+9zGgkvxgDVfYtbV/MSMr0wrBIRWu7oCSZtq0dUTY+WPwvJNy6PcZZxf83OlT
 iqJq1v966Ta9Wk9RnwTtJWvYZlaBxNX+uP4FH737b+rGA6gXnfrBBeJBmT6W2LDtOU4K
 oC+A==
X-Gm-Message-State: AOAM532POo/GMsTf39EW7PkcAJ8KoQbsHyzohGttbXM9CYPnmzWwVFXl
 QEXLAfKcqkbVbKqEUby2/rL75w==
X-Google-Smtp-Source: ABdhPJyfCri8fPG+JQJbVhxBdO9YUBouZjnBkehdYMcP4vzun3XUa/7RRGGncA9gW/1WlpVUMP9RIg==
X-Received: by 2002:a17:907:2111:: with SMTP id
 qn17mr2979879ejb.525.1607537193800; 
 Wed, 09 Dec 2020 10:06:33 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id w17sm2408269edu.90.2020.12.09.10.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 10:06:32 -0800 (PST)
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
To: Arnd Bergmann <arnd@kernel.org>
References: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
 <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <ee069c7c-c86d-2fa7-ab44-243483fdf108@monstr.eu>
Date: Wed, 9 Dec 2020 19:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_130638_871200_18DE1817 
X-CRM114-Status: GOOD (  21.74  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209180632.zBIaTlzDkR3IL2MWjzYhzsgkp3r28ocpW8bJJJbjUzs@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
