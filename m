Return-Path: <SRS0=eMXW=HH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48937C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Feb 2021 12:45:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFD3C64FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Feb 2021 12:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFD3C64FCD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZLNYMR1gW7I4nKClrwnF0LVLR4hfpqHKCHDnicJwjI8=; b=XffdGAWusKI7kPftOupuhMYSd
	hOwFAxDmUksLspgYwNhhGJRj2EXd572jeHJo1Cvhhp4kJyHhxYQ4pHUXWAhLuv2ag/qzlJmuRSliM
	m/iJLFEOWoZa89gepnDF/uKNyFlvT42hmrYws/VtiFAggUZ7mZ2dy/wLVJzk44EZZHxb4hJ0Ce/Sn
	ZH2bvuC3iztSuf6tDOONPBBLeMwTaeOddE5C1sj3rSPBrj0q57SdX88v3u+mMz/kEQdtbGurqybX8
	FZAmWtOvLzPni7vUdPEdxVZoJBaBQseIwLCkpHRC4SFKMUwJgg0ORWvP5AB4I6sKq5RAB7qJbJcnp
	R4cwmfe1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l80T6-0005Cz-PG; Fri, 05 Feb 2021 12:44:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l80T2-0005CS-Ac
 for linux-arm-kernel@lists.infradead.org; Fri, 05 Feb 2021 12:44:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8521964FCE
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  5 Feb 2021 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612529047;
 bh=h2qOOv3e7kAsV2hlLAnsoINg6+vs4lcX0hUtCmYe3lw=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=pPK9LB7MQvm8YsPJirQhLp4nOi9yXnD2kjUvboMKSOBNrvezB85SG4keDBQMIfRPn
 iZAFqADDAngV6hTb9pScXPzuO+05v2t3B6TgmuGNf7trZFWKtRJ7dkwbgI2vrIs2oc
 NmHv3yY5Gl0kzS/Ijf2rkv9Hm7Moh6IJg9RNU3XNonMjZACsGma8jDiQkGBTD8SGOy
 jhwlwOZPUuQ/FG6n6WikRGfzHiKQTwxk5//uO/JE8XitclsK0dnZWhFRmLhlbw73JB
 lVXXkh+FAxmqfg7JOAjKoXTeL7+XloliChbhLOGQgSi9q0xKBihuBVYpr1bbXEzQyx
 0LQ1Uhg1ZJ3Qg==
Received: by mail-oo1-f48.google.com with SMTP id u7so1585654ooq.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 05 Feb 2021 04:44:07 -0800 (PST)
X-Gm-Message-State: AOAM530EJ6lEiLtB14RmsHpe+quBhWjCJHN0nwgu4UXmQh+VizzYthjg
 WB0pwhlcl3z/1008tkxUeg18WCI89IR/bg5+m9c=
X-Google-Smtp-Source: ABdhPJyFNASGtUL6SFR3W/WWHAyCpbx4HXopFMsnG12PVdwpgJVxJ75/vU9c39mapas+s6DugL4fX6Zxp0n9A6GVJ+g=
X-Received: by 2002:a4a:bb01:: with SMTP id f1mr3330752oop.66.1612529046721;
 Fri, 05 Feb 2021 04:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <CAK8P3a3v6emxavbyjFhY+WdvH1t4EPMZSjEsSx0M+cRqjRCO1g@mail.gmail.com>
 <de236d0c-579d-c0d9-8d60-77f30889f50c@marcan.st>
 <CAK8P3a2DawQA-PD5aqbkVPB7UxuohN0oe9mJPe8488pUryotJQ@mail.gmail.com>
 <3f2001f0-4a90-645e-d016-03907228dc7a@marcan.st>
In-Reply-To: <3f2001f0-4a90-645e-d016-03907228dc7a@marcan.st>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 5 Feb 2021 13:43:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3DhP3AGWmmM_7O0H4KsaYEwEysdaGUdhJA-RX8A=Q__Q@mail.gmail.com>
Message-ID: <CAK8P3a3DhP3AGWmmM_7O0H4KsaYEwEysdaGUdhJA-RX8A=Q__Q@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
To: "Hector Martin 'marcan'" <marcan@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_074408_497290_A23D7848 
X-CRM114-Status: GOOD (  14.59  )
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
Message-ID: <20210205124349.FXTeoIuTEFOhCBlE0mT3zKHUoR5VkOSfJACprY1UL2M@z>

On Fri, Feb 5, 2021 at 8:11 AM Hector Martin 'marcan' <marcan@marcan.st> wrote:
>
> One thing I wanted to ask: is there some kind of "experimental" policy
> for DT bindings? At early platform bring-up stages it seems like it
> could be valuable to allow for breaking DT changes while we flesh out
> the details (this is especially true of a reverse engineered platform
> like this, where we don't have knowledge of all the hardware details a
> priori). The dozen or so users we might have at this stage obviously
> won't complain too much :)

We don't have a hard policy here, other than the obvious "never break
setups that users rely on". As you expected, this usually means that
I wouldn't complain if you change something in the initial versions
and there is a good reason for that change, it shouldn't be a problem.

An extreme example here is the omap platform that keeps making
incompatible dt changes as there is still ongoing work for removing
the remaining platform specific code in arch/arm/ and replacing it
with DT descriptions.

Once your port is fairly complete and there are users that rely on stability
of the bindings, I would expect all further changes to be compatible in
both ways, allowing old kernels with new dtbs and the other way round.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
