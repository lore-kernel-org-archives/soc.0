Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1AAC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:49:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975BC23BC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 16:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975BC23BC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iv4xLJ/Rdjr9CL/t/uYbjg7WYoCCQaIdNcL72pK126M=; b=X5Rz4CfeUwf5lbogtaglkndpb
	dDpkpBOKKP7g3OKJm5aJkez5rEZGuEEwZq2UWcI2HmSEpGbFysqsxgJELc/wRu8ssc8veB6EJDJSz
	purVlRyHJ1gG99BZ13rMKDBY1IdI9D/hpEQwHkbmnfj+SsFLixzBkIB3JWia2VI+wcT0w8VaXWQ3M
	1YKPKPCoAt/Gmm/C0p+QbUcm5ZhxpGu9eWAOmRdHEccFgR7YXl/TNsuQplq5HJyZc1MMtASBQI1ch
	X27BX5Utp3BjbdE+8DTjsdBo4xg6fx1fYYWlljuzKelwRKSANOyhhIskZia5zIRhL+OrnSJnQkcYu
	Abh8R1SQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2dM-0003HH-I7; Wed, 09 Dec 2020 16:48:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2dJ-0003Gq-SP
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 16:48:06 +0000
X-Gm-Message-State: AOAM5331fBDI1HNitZr/nhaTsCHTnugcQLuWbm+YY3d41VnlaQcIqEBu
 +gGTWoIRfNIFz3UwQthtvG9fBK1VwtmrViSSnsQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607532485;
 bh=eOXy3q/OrnpPVD7qFh+0rWuVST8KP6A+adEPD0I8BZI=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=FTaVKuW6Gzdo8SkfcT+QGUbk3Gc7qeCsbY6RCjXbPD5lHAkwXzgtrtgiZNeWfozgU
 esZFK+xcg8ZyO78zCGFwdeHlpqX21DJgO+CMzSv6ce6/2cZVwctQaqC0eATvbwSEl/
 3giCgMhqlDfN79XwsyVtp4a8xWK3HflMWD1xO6IoY5aSGKLj6slygO9qqeuBvIGQzW
 0zKedNROY3WaWIuzOIAtrKoz/XVM2U3RJQ3b+0DUHK8Hi/9X81HwRyVyMOYGzT0sLB
 2W4StgPK6NNl7OQY0QD8QdwrsCVdaxgDFZPQmg829DsbYlr4DbFLlyEqXglVNGTazk
 RM98vV0s/heTw==
X-Google-Smtp-Source: ABdhPJzLm/V1PpLyoHr7j2zHkSCHVXujtN5dqk3y81FTHDxPr0vVKWkWksZSlGCPJwwSzXfl0bP6k0Oo4u2Xw9RgXw4=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr2550724otk.251.1607532484268; 
 Wed, 09 Dec 2020 08:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20201129110803.2461700-1-daniel@0x0f.com>
 <CACRpkdYEzFYw=CbBFCs9=DfarsCQKD0zA2WvE95nF8ehA_2i1g@mail.gmail.com>
 <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com>
In-Reply-To: <CAFr9PXmx1XZmVOp8mLygnDUfEKPpo6=ZQPMKSCnZf0i23mNqVw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 17:47:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0KHiO0Xis9+hiJa7uDZET9xzf7wRExxZXBUFXeAEMXqQ@mail.gmail.com>
Message-ID: <CAK8P3a0KHiO0Xis9+hiJa7uDZET9xzf7wRExxZXBUFXeAEMXqQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
To: Daniel Palmer <daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_114805_989922_037BBBBF 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>,
 Willy Tarreau <w@1wt.eu>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209164746.nlCKtJQgcIrwE6igEhlCtXvfA5oBTZX_T1aoUEeKiUs@z>

On Mon, Dec 7, 2020 at 11:55 AM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Linus,
>
> On Sun, 6 Dec 2020 at 06:43, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > OK finished!
> > Patches 1, 2 & 3 applied to the GPIO tree for v5.11.
>
> Awesome! Thank you Linus. :)
>
> Arnd and Olof: Sorry for being a noob.. Is there anything I need to do
> for patches 4 and 5 (device tree bits)?
> They are in the Linux SoC patchwork.

I've picked them up from there along with the second series of DT changes.

The easiest way for me though is if you include the patches in a pull request
or patch series that can go through the soc tree in one chunk.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
