Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A5FC433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 08:36:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FCE2399C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 08:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16FCE2399C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R9DgNwGYOx5CRVThhqwEsmPTkESrnMdBxRB6JaXMrY4=; b=uEMtrtzCRbWugaKsRtGT6El/l
	uFvBQZ46oz7X3RbtKyKMai5TKCK3AWbMgeAEb0IknyPo0jg7J7orQJ0EF4aCv946zm5CJkvDBtOXd
	v/66q2sCFI4mnsnctkJYSBjduIlkwkuF6t+31LXhc2nOVSxigH6ZWpZCX52/wORExmlHbssYHG3xW
	IQPrdiytgEr6I+3qNEj22Zvx13gmZDezSG321NfaLPwNuAsOqdEv4eS8NoZuQKWaNLhTu6p5g2xKm
	4RjaaB8kP/gb0N+Y7KEk6FfgeyHSjR9EkFr6W4+XUQuzUvLhThKPSYgzf2fULEEWHwftu+WEs8+DR
	JDee+6h3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2VQk-0004qP-6D; Thu, 21 Jan 2021 08:35:02 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2VQf-0004p2-9Y
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 08:34:59 +0000
Received: by mail-lj1-x231.google.com with SMTP id e7so1508955ljg.10
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Jan 2021 00:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lS8yS4z5gTRHyWYZ/MorqH00QDK2F6AOgR3jNZjO6uw=;
 b=BPXcee2xlc4t3zVun2eTfkyri06k5pl6h7fkauTSz0bMHzX51jxkZGvUWY4HmCBHfU
 Uqos+y9JB+nfRQXjsyU+fk7JyjMM/PI+94oZGRP4bEToOrt0vz4OgIUj2WqYPU5MTQ2R
 5YzLNlb/3NrRjd7nZOfVCtQD8MZLu7Ift+AacsLu2R2thwngH4IxM/2eABKE3/kiP/kN
 6RmQcR/yIW31FDZQrU8qJ+ViMK58pM+f5C80rGqK/lkl1AvWmMwXGH5by8rSwK8cs160
 mTcFLMuvN9xyAMiVc6emqDMHJrosXy13tNeBMWbkFJMQ5iV9aHlUZ/zzRRq5Ok71qehj
 cVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lS8yS4z5gTRHyWYZ/MorqH00QDK2F6AOgR3jNZjO6uw=;
 b=ld6d2gpuI9A8Guw06ohjKJeMo3Lg+gq+h7ByQCp6FKSkVX6uNo+kv+WME3DUcclgrH
 hnQF58A3Oz2lGCfI65Qi80Bw8MdGvC21V+qdWYSjesneHaQ0wf4gEarf36kCMc0wLR2G
 8wEXIBaHUKhHTatLE68lGM4KTlxe3eYHSHNxevVjqr85zE6oi4K77xM0fHvXVdobXkw+
 PXZ4yGcip+GBx0JJZWM7trzwsO+UpnBrFxM2rJp4iOtW+kIjY2bmCLXIZze7yF24eDRF
 srq9HnCP/nfThe+HOKtLPLtRcEIJB7P/U6stDIVml+0J91IAuDd1IdImS1EVIP+KIds6
 Y1zg==
X-Gm-Message-State: AOAM530IHiwGDqGEvyiUBTCb9M/+Ys4YnfVkpHlmABVej1KYMXPPweP0
 FiOeY355jFl2UbGBrtXdWEpIorK8sVaE4D0cgQpF+g==
X-Google-Smtp-Source: ABdhPJxMfoLva9Z9+4Vk5RdQNogIN4B9DKEC7RABIHA5mu0hvaAFjmZSPKffe1TCkudstO+9cv1RdOfrQh93Tq/e4jQ=
X-Received: by 2002:a05:651c:205b:: with SMTP id
 t27mr6291564ljo.368.1611218095600; 
 Thu, 21 Jan 2021 00:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20210120124812.2800027-1-arnd@kernel.org>
 <20210120124812.2800027-6-arnd@kernel.org>
In-Reply-To: <20210120124812.2800027-6-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Jan 2021 09:34:44 +0100
Message-ID: <CACRpkdaMZdUebQy7KOeAQz9wqGUWW3_PJUcD8N500NQZ0wXX2Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: remove u300 platform
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_033457_334904_06CACBEC 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121083444.0H_EJbUVMevA928gmGmxwR7dlaHPFXG5SHlvzOQDfi4@z>

On Wed, Jan 20, 2021 at 1:48 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The Ericsson U300 platform was one of two ARM929 based SoC platforms for
> mobile phones in ST-Ericsson after the merger of Ericsson with ST-NXP
> into ST-Ericsson, the other one being the ST Nomadik.
>
> The platform was not widely adopted in Linux based systems and was
> replaced with the far superior ST-Ericsson U8500 in 2011, but Linus
> Walleij kept maintaining the code for the whole time.
>
> Linus continues to use the Nomadik machine, but decided to drop
> u300 from the kernel as part of this year's spring cleaning.
> Thanks for having maintained it all these years.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/lkml/CACRpkdbJkiHR9FSfJTH_5d_qRU1__dRXHM1TL40iqNRKbGQfrQ@mail.gmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I was planning to do this but you got there first :)

The reason I cannot work on it anymore is that the device
requires a special signing server to flash new kernels and
I don't have access to that, and we never created a U-boot or
similar for this device so anything needed to go in through
that flashing tool.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Will you queue the patch for ARM SoC?

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
