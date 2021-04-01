Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CFEC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 11:05:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC871610CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 11:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC871610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LmZF3ejSkLWn1da0EdY04ZhDZqna3HjH2cb1QbE6qkE=; b=oRpnJ0f9mBBt10yjVyufeESOj
	n2nomyg6YFlTt2EoWfK8zsSz9+HGdfEwBWUvmfacZeBdXn+wxBZe7BevvAwLcJDR2aenTRaDnLwiv
	ALO36KdKE+LHFneKjPXgEn9DinMqyS+M5Ni3SMNRSVEUZy1z9yVrVBYwk54t12SRMEyB/ewwFmlaT
	QOGAWmf3UPgc+fSAD8yHcW+7M4fiHO6OuUG/rLb4bb+iDscgmUQFHOS2lFaIwEQ/vgAvIIXVbnGXs
	MW4oB2PNlDmYrTYUp+9FRJEOC1vNHxgTuPswvGrW4WcWt+o6iDdxhd/gzrGAaVvSlcVGkfrcGD6Kc
	o7pKllXrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRv7Q-009JpY-M0; Thu, 01 Apr 2021 11:04:08 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRv7K-009JoH-Td
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 11:04:04 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MMFdY-1l9qZK31ks-00JMzH for <linux-arm-kernel@lists.infradead.org>; Thu,
 01 Apr 2021 13:04:00 +0200
Received: by mail-ot1-f51.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so1709108oty.12
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 01 Apr 2021 04:04:00 -0700 (PDT)
X-Gm-Message-State: AOAM530uCXHWuVhvKbiN1OxMg4sSrTEAi0BDD5tYd1EvyWm3S1Mik9pF
 ZG4FqajMxcXT8ITo0kLCQHyP5T2KGOsHDz0GWN8=
X-Google-Smtp-Source: ABdhPJzv7NfJJM5P4rtmBV6imKoE6SXOGcuNPsyG7xm5vTrhAebddjzZDciuJMsX9IJPq79khP0o2GXRH+qVT+juje4=
X-Received: by 2002:a05:6830:148c:: with SMTP id
 s12mr6614473otq.251.1617275039517; 
 Thu, 01 Apr 2021 04:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210223061830.1913700-1-daniel@0x0f.com>
 <20210223061830.1913700-2-daniel@0x0f.com>
 <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
 <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
In-Reply-To: <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 1 Apr 2021 13:03:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
Message-ID: <CAK8P3a1L62YT1WUxmmfLNmvERo7DbeVwfCHCxuKvxs7Uap+iXg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding
 description
To: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, SoC Team <soc@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Willy Tarreau <w@1wt.eu>, 
 linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
X-Provags-ID: V03:K1:ap5t1kxj5exkWrhA3qI6l4pGnwkAy7PvDIaxKhLv9RlnW7aRHuc
 TwxiCyr/SxrTSgpoB/1lNfZE5wsDPwP6qcszYgXoi9nE2ODiC1dljGjpr6G0ax3rH2pVJcZ
 vIeiWn4L+862rKvEWP5nBnFIf4MmVNGMZvFw/mXAYKcDHgp5vRT/ImdAk19hhWFagnm6JI/
 DkTMTkwV6jE/+xe1WDI4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w/9LgZC90v0=:hDMIxoKUEvMh3Bvwq8pUf1
 +ZE3Fh0XNFqIMtwvnpQZ/xyW1iuHzvwxtBZpTsodX/7t+cWsMzlHHfFhKb15GwNZ+26V6xU1U
 8c3VQ+NvXmFXue0WJyjfMWmvOWJGvUCCWrMq4xGBvdGCig/vp76cUuoHF8H/LQuAjSut5Sit9
 4vVaomFy+iR2q228ACyRsZUJem/Se97PwP8yqDEFp9jW0o6Si1ZMB3vTSsQyZNxCtDZ7QkWdU
 lgOzNyC6PqDdcF8P2WMMk2R6dZqFXIHsqaLQhvg6YI4sShkOG4YEO54tj5WoV780CMgs01bHO
 nNVeJONhgBRaA5GBg1grTnc6rqDSpeNHvjy9pbRns2aQoPO6YzzEgd+EsZyQ4+4e6OEfjlD2d
 L1xfun8lGV4GmZKUg4AVUqXtu2USoV01g7CDqFE2n28Bf6Nf4fsT2eopk+/wWGEvVdQWc8xxk
 EBFkDdf9xv8uuU/Xj2eZe3sheNiPrlM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_120403_068864_AF028BF7 
X-CRM114-Status: GOOD (  15.60  )
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
Message-ID: <20210401110342.xwjBaSgmGUtlP96sXLyySu_h2-5Ut_VktlqH1oA16cA@z>

On Fri, Feb 26, 2021 at 12:31 PM Daniel Palmer <daniel@0x0f.com> wrote:
>
> Hi Rob's bot
>
> On Wed, 24 Feb 2021 at 04:34, Rob Herring <robh@kernel.org> wrote:
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dts:19:18: fatal error: dt-bindings/clock/mstar-msc313-mpll.h: No such file or directory
> >    19 |         #include <dt-bindings/clock/mstar-msc313-mpll.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1370: dt_binding_check] Error 2
>
> Looks like I sent this too early. I will try again later.

I found this is still in patchwork as not merged, and I have not
seen a replacement. Marking all eight patches as 'changes requested' now,
please resend.

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
