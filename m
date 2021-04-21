Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76277C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 12:56:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DD66143C
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 12:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9DD66143C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=md51nWk9XNK8FDxXhlIyMxH39w5IVjvVwH10df9cXBQ=; b=LaBAvlxJOA0QroHVDcxSDJNTw
	OtmtbocX3pEwieX6mgL77grFfDLxQnek598LlgP1elU26ApzkB2EX52AprctcgZ0oD8n2VleFpLx5
	CNFJI3P+KirRYhTUi3nxPqQD4X24AkALNV8pW+6pPlIUTdln49H16JVv/0o5IqxEa67+TsPZFpQ/W
	1ketLxpAEi3luJDHRtx0a1RxdwV0c5k1vHUFz3EVZnfrtQri7c6o+wUyg/p5DR//AJN3J7Z3sPewS
	83yhZ8Sw/9blV9j5vDk2y+/IaiPYUXpvKHhGZOVSJcjFQlEmQaEeGnV6XKVVM2RbQWacb/pn18Ywt
	obqBnAt9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZCOi-00EPdr-8y; Wed, 21 Apr 2021 12:56:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCOe-00EPcP-6K
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 12:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ggDTr+tPxGHKoEXztExo4US4OVldvECmIzW4y3KN1q8=; b=3mgtEBqkRakM0tc0sUyHI+3FDg
 /23/IPaQ7Um57m7eEt02uIK/VJxUFgjGaM1Zzb8HjvMuO/z5EUT/zNS7NAktKYIufRJ/jl1yHgnSx
 ZHEls1zD4SFFz/l9owkg+RJDNSXYtSZsigXobs5y5alSRLLYc621kCAexqNat20B9QJQBTfHjnqBd
 pbWt095nQU0PxfKp7GAEEuDxC31wJdBfoAz7OKIZSZpMH2BJkRtiVF5fuDuu3c5V7bt0giC3Eyh4g
 8N3OhTlxJUh/O6JDzofC7wqLeYSjS3EfiLCcae8d4UMYeavy16w+1yrTmSKjAynmrpRTSI9LNaO6v
 DTGJU1yQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCOb-00Cse1-Nd
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 12:55:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DF966142F
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 12:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619009756;
 bh=fSsh86qLprsO1kcQt29TEsyA8cpEvg5cI35j3iApJRM=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=n02jdIXFCGNtIjceg5OXBVvAm9Z/VSlujlk7HglU+1jZdt7lyginJAY83fmQPz3et
 lEtK+HCKIT34xQZGH4zQRSgh70ipGybW+syM9ZK1Fg2bHetO+eIbHfQdN/KBDjQ/yG
 I1i5cCAWZbXeXP89qvhYaq7Qfa8INXGBmRa+I+RvJg5fqJL61TlvCUBGk2WecYsZE8
 CAeJxFS/khIJOuyhqp0mNhooyXDHlMAc2UXB6fOFkNOM1UG55PuzXYBcxAAGYJQ9H6
 yq6KV9bUNfFcjQG4VPSmB1WGUUr0WGb8gvOmfWP9tROkArT0aUfEQvIlauMuGlDT2L
 k03XdYg1FSWGQ==
Received: by mail-ej1-f53.google.com with SMTP id v6so62049095ejo.6
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 05:55:56 -0700 (PDT)
X-Gm-Message-State: AOAM532tFZqj0c8QwbsaxFHrHcIgYE2sjudPYSQ4SWxB0wXNr3tp0uQ5
 DEAuT+R7s4lJV7gseWMLSZI8REM/uBJSHfJOlQ==
X-Google-Smtp-Source: ABdhPJxoknV1LylRYldTfToFJatnshqs0NvjEq9ejw38eVnHcNBIFwd0QzkNmChSw2+oJuSOmuSBAf9rZpnaWPQfUZA=
X-Received: by 2002:a17:906:9ac5:: with SMTP id
 ah5mr31960595ejc.360.1619009755089; 
 Wed, 21 Apr 2021 05:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210420230402.8807-1-khilman@baylibre.com>
In-Reply-To: <20210420230402.8807-1-khilman@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 21 Apr 2021 07:55:42 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Z2Mxy_m1QpqgFi0M7DGqMYUwZhrgk_CP7Vy1frAzUcA@mail.gmail.com>
Message-ID: <CAL_Jsq+Z2Mxy_m1QpqgFi0M7DGqMYUwZhrgk_CP7Vy1frAzUcA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>,
 devicetree@vger.kernel.org, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_055557_843636_1EBE0693 
X-CRM114-Status: GOOD (  15.94  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421125542.RAUQ8cwuLWtRdcwcznhOSMnQlqvkf15y52zb0q_51Sw@z>

On Tue, Apr 20, 2021 at 6:04 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +++++
>  .../bindings/media/amlogic,axg-ge2d.yaml           |  1 +
>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>  .../devicetree/bindings/sound/amlogic,t9015.yaml   |  1 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>  18 files changed, 38 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 184492162e7e..db2240bad012 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -69,6 +69,11 @@ properties:
>
>        where voltage is in V, frequency is in MHz.
>
> +  dma-coherent:
> +    description: |
> +      Present if page table walks made by the SMMU are cache coherent with the
> +      CPU.

Copied from the SMMU binding whose definition is a bit special?

Just 'dma-coherent: true' is good.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
