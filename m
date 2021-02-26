Return-Path: <SRS0=yS1I=H4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBAAC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 11:33:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE35964E6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 11:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE35964E6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YpwqqDZPu1rNN1EgiwY+AJr0O7f56nUFhTeha8Y+YtA=; b=sBjQF4VXKv5LH91N2I4auJ8Uh
	eVgxhA2C2bLG8D8fdDcwuhT2Y67bBJhZ/qwee6uUqySptITipCHJcNFdxkc+Kp5vUryYbgDzwmE1Q
	NWdxtfGh+kiZ9Z88BgD/KueJq1rxHv4iSRcJACDAAfmpCkPtcFSYi3uucwWhMEOs6DRkPWCszG7lz
	2meh8kqc37sKinfQVvygyYV/GA/uBEq/xNxMRrKldgE8oxtgOOonjiGGt+ugm5XFmkQmbm/5cHhYf
	/pY+a11HdxBRE6LQNuoy9JetjgmBwjhQNnVSuhANHFKYBayJX+BzH1+NqhZB8EbK3gvR85zQdGVLL
	foO7+Ytyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFbLa-0000wK-Qz; Fri, 26 Feb 2021 11:31:50 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFbLX-0000vu-Jl
 for linux-arm-kernel@lists.infradead.org; Fri, 26 Feb 2021 11:31:48 +0000
Received: by mail-qk1-x72f.google.com with SMTP id z128so8635524qkc.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 26 Feb 2021 03:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtwGzwmXCwfuekrnY8Xp3zryCjWTaKAtQqWeYvJYHDI=;
 b=IpZdAGjjww2yK7Jevu2iUTH/1ORVnE1GP45V0gbBup5kNdvj7KGTGT20s2j0a5PZtW
 S+3HhSFd8XgHpdGE86R3GFavD+1+IKlCzk9xxeylY6NBEkcZWF0T3xfwrAY3/GhCmPak
 rN81Nja34w7f+LeSBMWGiVaoDguZpdo84SOQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtwGzwmXCwfuekrnY8Xp3zryCjWTaKAtQqWeYvJYHDI=;
 b=K057eSsrF/G9OUzdXIQjL8FDFUkKzQFzom2O/UBHY1PuqS8ihie3Mv0JgYeagDgKWj
 Xw1mC6dDYZ8EV5LB5O/5VfOpafEx55A3FDtC2vh2/4OkivI6+PZfUVnft+f/2rxqE2dC
 kq7vOQQmjOL03K44LSPJy5JCF5EWEDsZck2pZIV/tJepRK3elN0g25qWCoGbOcwmKyvb
 BK4gfFz8XzPl5NvebESWI58bg3aWOV4NKbVkXgca8JifBJcfMa2h/NRfxW9NAMOuQ7mT
 tjkw1NNXMyM66GiLITOPydQacTN0KmZIZhiEXGu04Ve97n4hApq4KqQhrUr/xVsJYK8M
 R1vQ==
X-Gm-Message-State: AOAM531dei6GPRxbNUktshxJnrgtyEL9HQvrcXJg2aU0lfJqFOI95hzz
 7Vnm2RJmyS3Ssvv1uuLso81s/FutgwoGuNn8HpEutg==
X-Google-Smtp-Source: ABdhPJwnjTvOEGoaSYCM1w3lr13lrnyZmgopzVsHcWgIw+GBGh/ABGQCJHdvC5AWt09QvIxIIAVagq49zfIZLAi2Qh4=
X-Received: by 2002:a37:ef09:: with SMTP id j9mr659750qkk.390.1614339103306;
 Fri, 26 Feb 2021 03:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20210223061830.1913700-1-daniel@0x0f.com>
 <20210223061830.1913700-2-daniel@0x0f.com>
 <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
In-Reply-To: <1614108850.540354.4116103.nullmailer@robh.at.kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 26 Feb 2021 20:31:32 +0900
Message-ID: <CAFr9PX=h2JPdAwjYS2849ufH=wnxSti2Dj60fbq4bg8b8=xy_g@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding
 description
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_063147_837497_86D9994D 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: DTML <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Willy Tarreau <w@1wt.eu>, SoC Team <soc@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210226113132.XfV2Y8Bihc9uabctWrU8C6vipTbKN-I6bH3GxAv9o6g@z>

Hi Rob's bot

On Wed, 24 Feb 2021 at 04:34, Rob Herring <robh@kernel.org> wrote:
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dts:19:18: fatal error: dt-bindings/clock/mstar-msc313-mpll.h: No such file or directory
>    19 |         #include <dt-bindings/clock/mstar-msc313-mpll.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[1]: *** [scripts/Makefile.lib:344: Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1370: dt_binding_check] Error 2

Looks like I sent this too early. I will try again later.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
