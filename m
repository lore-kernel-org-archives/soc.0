Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9223AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 23:09:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27C9464FAE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 23:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27C9464FAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tYcHsz0nT5C7NZe4V2thulcKh720xopXUt9llvjmD1k=; b=a8sZVEAUeBVuMYTNn7Fm3tPOh
	vbRUF3V4hvOxiygJpcdpajusE3LNvbaCFZ1nOt458FZ+RCXNHChe9RwELXTOLyDAALhgtaBM0FhzB
	PyXg/Ucu1T1z6aQPoNMXOXjpCPHLX/zmGEMwRpM5IsFoHCEZaWZSnrcNmqmLJxYOOrHyghdpdcgla
	UKHx6g7LiAQKHd7XHKlvOxbosIxppup1udCHgtPH+MZ1T85Q6nH84CUUMWmbAVneXcrLf3vp/J9i0
	22A5jiJWZgsyNESb/5YoBsZ9GYZ7UrW6XNFZ3J0lMBoI4ZlcQp+Zf0jwMMR1MPp80FLqMcMppEhxe
	S9k8CeU9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7njf-00038X-UE; Thu, 04 Feb 2021 23:08:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7njd-00037u-2S
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 23:08:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E81AC64FAF
 for <linux-arm-kernel@lists.infradead.org>;
 Thu,  4 Feb 2021 23:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612480104;
 bh=lGAiTppQQ/0C6EUbyqXF6XF9gQYyK5MEz4wybY4KmSo=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=r8G7A8jHN6cRgolLUzhjA9OyGgKp87gpP/R7cV7sOKiJHoJ8uGJhXbK7cu1cr8fI9
 qLlmthmlfU58UFENsenUNbttptMFhrMlUmPL4FuBoOxpGql0ABnCSlwfKXlv+dmV9s
 TvdG+KPLoxmKYt69hZMz9WUpOXbEkfxQyffrYq2pd5+tXusvsc6xSd6Ek4brb2Bqd7
 r3W2QvTptUy4eCnM8ux/2yx7gO5kSDAsiAxIN2enZM1RcaWX+N7HHURRnVFq4mGVcL
 RwVr7I3FxvjA2Rwqij2GICZFP41U94hwtLO2dcafrox1GJcQktr2ttlrZYt4IERLgq
 tJFCuc3ItZCrA==
Received: by mail-ot1-f47.google.com with SMTP id y11so5159094otq.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 04 Feb 2021 15:08:23 -0800 (PST)
X-Gm-Message-State: AOAM5335nnaBuLbhAArRzZVI2kF/sKDro+vZJT68kyUbJCDsVdSAaIGD
 ncbGHcnSRI/KKST3I2V0hUYudkvd7LdCA95aLwg=
X-Google-Smtp-Source: ABdhPJyAtb8VtJYcphzzBXiGxDDtreYAG0q01vcVCWQSQA45vFgL+t+pPaoS4Lt1cl6LfRdRy5YIrtyl+QSYZILiN1s=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr1248095otq.305.1612480103175; 
 Thu, 04 Feb 2021 15:08:23 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
 <de236d0c-579d-c0d9-8d60-77f30889f50c@marcan.st>
In-Reply-To: <de236d0c-579d-c0d9-8d60-77f30889f50c@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Feb 2021 00:08:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2DawQA-PD5aqbkVPB7UxuohN0oe9mJPe8488pUryotJQ@mail.gmail.com>
Message-ID: <CAK8P3a2DawQA-PD5aqbkVPB7UxuohN0oe9mJPe8488pUryotJQ@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
To: "Hector Martin 'marcan'" <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_180825_299719_A44CCF98 
X-CRM114-Status: GOOD (  30.65  )
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
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204230807.OGZuPa30Cevg6gfc_KCm_TfjjYPqeUpm0_ayd3ipsRw@z>

On Thu, Feb 4, 2021 at 10:44 PM Hector Martin 'marcan' <marcan@marcan.st> wrote:
> On 05/02/2021 06.29, Arnd Bergmann wrote:
> > On Thu, Feb 4, 2021 at 9:39 PM Hector Martin <marcan@marcan.st> wrote:
> >
> > We tend to split the dts file into one file per SoC and one for the
> > specific board. I guess in this case the split can be slightly different,
> > but it does feel better to be prepared for sharing a lot of the contents
> > between the different products.
> >
> > In most cases, you'd want the 'aliases' and 'chosen' nodes to be
> > in the board specific file.
>
> I thought about that, but wasn't sure if splitting it up at this early
> stage made much sense since I'm not sure what the split should be, given
> all supported hardware is the same for all 3 released devices.
>
> I'm happy to throw the aliases/chosen nodes into board specific files if
> you think that's a good starting point. Perhaps /memory too? Those
> properties are filled in/patched by the bootloader anyway...

Yes, I think that would help make it more consistent with other
platforms even if we don't care too much here.

> There are also DT overlays; I was wondering if we could use those to
> keep the hierarchy and avoid having many duplicate trees in a
> hypothetical bootloader that embeds support for a large set of hardware,
> having it construct the final devicetree on the fly from SoC + a board
> overlay (and possibly further levels); but I'm not sure how that ties in
> with the device trees that live in the Linux tree. Do you have any
> pointers about this?

We don't really have overlays in the kernel sources (yet), though it
is something that keeps coming up. For the moment, I'd just
assume you can have one .dts file for each thing you want to
support and keep the shared bits in .dtsi files.

> >
> > Did you see the discussion on the #armlinux channel about the possibility
> > of moving the cpu-enable method to PSCI based on a UEFI runtime
> > interface?
...
>
> I saw it go by but need to review it again; I've been missing too much
> sleep this week :) thanks for the reminder.
>
> I think we might want to start with spin-table for now, given that there
> are no kernel changes needed anyway, but I'm happy to take the protoype
> for a spin (:)) and try implementing it in m1n1.
>
> I do think it's valuable for whatever we do, at this stage, to not
> require u-boot; having that be an integral part of the boot chain is
> perfectly fine in the future but right now it helps to have a simple
> boot chain while we work out the early bring-up, and while u-boot grows
> the required support.

Agreed.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
