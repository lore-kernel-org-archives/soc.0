Return-Path: <SRS0=3r8u=P4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BCCC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Nov 2021 00:27:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 712F861054
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Nov 2021 00:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 712F861054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oX27Yp5/AWgUEK9MzMqXXWmQG9xzNIpgurk9v+bv3vo=; b=pWCCDuvCPAOTSz
	O5HOiivktFOwJUkTFRR8rcqVEf7xhbRF7K3XvePSRDLgz9mTCH6WwT0IAw9EgwzWKOiOjLxLGtEoP
	d9nbs0KgGmETlf/F+ERRcELCA7+UYL4+rdmyPtoo4FUaD2BbjvT2CMWUP5SHFZihfuFtHUSpdRikB
	Er4LalosAGZJ69ABJqXWmJDSehXjg6jKSwrBYLZ0nIHEDO21LdNu3TcBlWfqhOPNP0xMGufERU0g5
	MYeeCdQkz9UeHJCDQBCOI6z7hgBNJzH8+Ql5nfc1adcQGckfZC+NfgXVeLm4ET9eqn3FRbZcbaU2r
	UmNnFS3wpm2dd2TL3xaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkExj-0003NC-BO; Tue, 09 Nov 2021 00:26:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkExg-0003Mt-6Q
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Nov 2021 00:26:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 383B76120A
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  9 Nov 2021 00:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636417563;
 bh=tNyHmn7MoFG7hGgzaH5iztXIDQ91XHEjgXIf7yVyImg=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=tEBqybOJxNaLmxWJg40hpf+l8w9g/ZPAo/0zDbagXH+0uKT4OOi6bksxuXMI91Rw6
 wx/uOt102JX1Vdni+9yVGrSRTzxTdGgwVUw5taC0yviF39/nfezDbefmjUpAUVvn85
 o5r0yiqxBSIV9RfKkt68QLnoaARB/coEcrbVgVTQZn3O3/nv3Qfbf9YaHBBVaotRmh
 Pr5rxUiCVkgeVmEUaS+6O/wfbkXU5TyM9Z5Lr/bklLIcvrHPIxYBnQlyCkSfUoibZ/
 MaEjrvu+4RPhF/HeUYQ0KHHVJgBQyM/0mvfaXWh3yp5Xy/7XDj4zEM0rdIVYk5IMyF
 9sSxcEGNfZBHg==
Received: by mail-ed1-f49.google.com with SMTP id g14so68881403edz.2
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Nov 2021 16:26:03 -0800 (PST)
X-Gm-Message-State: AOAM533P9Hx106dHeBMsbZVHxkBrMhjsD/8oUc3hUUbsC+s2Aq/JaNFM
 ElFn0PI+GWx4EDNY/SqbQSSw12d2DFsPBpo8Qg==
X-Google-Smtp-Source: ABdhPJwOg7U7/SkPH9Z9GutFtAb8W9OtiSRxQGQ5YxNEBT5VNJyIgLfLqyka+tL2yoRRAm53DoLYkgdk5kNLrUyxb+s=
X-Received: by 2002:a50:da06:: with SMTP id z6mr4231493edj.355.1636417561688; 
 Mon, 08 Nov 2021 16:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20211024232003.211484-1-linus.walleij@linaro.org>
 <20211105183930.GA1448386@roeck-us.net>
In-Reply-To: <20211105183930.GA1448386@roeck-us.net>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Nov 2021 18:25:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+XAVio9Drvi-XPN=wHojE2PaxLa3pjxdO73H_0iVXi3A@mail.gmail.com>
Message-ID: <CAL_Jsq+XAVio9Drvi-XPN=wHojE2PaxLa3pjxdO73H_0iVXi3A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: arm: Update register-bit-led nodes 'reg' and
 node names
To: Guenter Roeck <linux@roeck-us.net>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 ARM-SoC Maintainers <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_162604_277906_2A1053BC 
X-CRM114-Status: GOOD (  18.50  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211109002550.rajAc_DdEMxMWsQKwwMYlJKa1c_2yrJMCSceTaagY1M@z>

On Fri, Nov 5, 2021 at 1:39 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Mon, Oct 25, 2021 at 01:20:03AM +0200, Linus Walleij wrote:
> > From: Rob Herring <robh@kernel.org>
> >
> > Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
> > The 'reg' entry is the LED control register address. With this, the node
> > name can be updated to use a generic node name, 'led', and a
> > unit-address.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > SoC folks: please apply this directly for v5.16.
>
> This patch results in widespread sysfs backtraces with various qemu arm
> emulations (versatilepb, versatileab, realview-pb-a8, realview-pbx-a9,
> realview-eb, realview-eb-mpcore, integratorcp, mps2-an385).

Sigh. I'm working on a fix for this. Though the only way to fix
without a DT ABI break is reverting. A stable kernel update is
probably good enough.

There's a problem with the clock changes, too, but it looks like it
just affects the CLCD.

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
