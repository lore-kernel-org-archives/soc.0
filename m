Return-Path: <SRS0=WGdq=M2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E48BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 17:13:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0F4B610FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Aug 2021 17:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0F4B610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmC3JYWJUUA8nCcAVsS2kgVecCLn0kYDqzWHl0CYKoQ=; b=UUD8f+qKNpK+Dg
	msFu4M50VmVDPWKzegtnaAy1jE2yYYWNV0GsLOuzBZ8Vx3rcUTtAuSFYYIUcFstZR2xj8ne+9mFBC
	sWcJE5W0XlwQPNWPuRIfM+KDiPY7OZyiGbcP4jW4VdYCaBi8JsqkxSRYD3D99tod54pM7nMfUDczb
	wg0CyO28RiH4zq8HkxoEwlGfhth5NJHAnsOChVZBY9PQhBwx2KiFc6wGeuvCoYjF0pZH1ETAeeCf+
	DBEpANhJM9RVMbb1KJ0e9axgYCb5pvceMKUnv896evtSAsqyXOkEdSb7KnhAVv6d1OT5Lux4Wj5A/
	eLwYMWsdksJ8bFL8WEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAxxb-003m1m-7P; Tue, 03 Aug 2021 17:12:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAxxX-003m0n-HD
 for linux-arm-kernel@lists.infradead.org; Tue, 03 Aug 2021 17:12:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8975F610FE
 for <linux-arm-kernel@lists.infradead.org>;
 Tue,  3 Aug 2021 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628010726;
 bh=YKZgz2PIIA5ojPbgTMT8sUlcZDB7x/kiBLPAv6SkSCI=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=hEyoyKRHMnlr78wASkDHdVfwUbx5SJ9S1rBsLSdki2lkS5wcrB3Zn/FNnh3lHOXNm
 KH4PO0xwCeNYsaABvvWrARC5xDBZrydayyPRczebhBBx92VOzA0o7nnfnTfDV6Jz+T
 /4wuV+RIoDIrOERkwtVuOa9MsYu0mf8Zexwtv0LMo0tpRgJ24Y0CYUp0u0pcCNIP6h
 c21Rkr9CMXd4sCVwvTlZ59frAdLz1faCVQdtx7v379LUyn7GYkKyB+/zkhRwDXTQcg
 3BW6zvWI/HdOSHD3DW0HIN2PFR5CHH6qrxAKM34ifoH2+xzQ/xfPMvbDIJXV1dXSAz
 +QCJv+z0yJ+fw==
Received: by mail-wm1-f48.google.com with SMTP id u15so12894421wmj.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 03 Aug 2021 10:12:06 -0700 (PDT)
X-Gm-Message-State: AOAM531TS7t50Xpi6LvHoWlM13F2Erl8fVEKD21I2TMInVY1dIqjWczZ
 H0oY6lc1cP3PuhyHlKaryFBW8keCpKgx1ooKPgI=
X-Google-Smtp-Source: ABdhPJyFUUcsrSm1AzyQx3pvEZx6TT8YFnsUeo4wDlqkyr7TYiklG+prW2K275cVpvzd/XKyHL8AAT06vnq0iveLKzg=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr5372161wmg.142.1628010725128; 
 Tue, 03 Aug 2021 10:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210802141245.1146772-1-arnd@kernel.org>
 <CAL4-wQqCL1S-GYu7VKJeTT37wh=rR=SMUuwgKiXnnn_Y=uydOA@mail.gmail.com>
 <CAL4-wQpKLtSj0xfNUXXLhbtN1wC051jpRneAuLYOi1riZfiinw@mail.gmail.com>
 <CAK8P3a2z_xxpz9hAYoBx5=bS81V=TkjEU6WHNhPi1UhQ3UScfw@mail.gmail.com>
 <817752520.64672.1628005929651.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <817752520.64672.1628005929651.JavaMail.zimbra@savoirfairelinux.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 3 Aug 2021 19:11:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a042r2V10WY=M3mvhZS2Q9_iBHLDgSNzJpJEGgNJOD7zQ@mail.gmail.com>
Message-ID: <CAK8P3a042r2V10WY=M3mvhZS2Q9_iBHLDgSNzJpJEGgNJOD7zQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: remove MaverickCrunch support
To: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
List-Id: <soc.lore.kernel.org>
Cc: martinwguy <martinwguy@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, SoC Team <soc@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Hubert Feurstein <hubert.feurstein@contec.at>,
 Lukasz Majewski <lukma@denx.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_101207_628309_889936F0 
X-CRM114-Status: GOOD (  13.02  )
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
Message-ID: <20210803171149.4px-JRRpxjXQ5CDJxQ1L4k9RA-nzR6GPB7-sPzV_9QI@z>

On Tue, Aug 3, 2021 at 5:52 PM Jerome Oufella
<jerome.oufella@savoirfairelinux.com> wrote:
>
> You are correct on assuming usage of softfloat toolchains and not
> using the MaverickCrunch unit. AFAIK, I am not aware of active users
> of this FPU on recent setups.

Ok, thank you for the confirmation, I'll queue it up in the soc tree then.

Of course, as there is nothing wrong with the feature other than it
probably having no users and breaking the build when using the
clang integrated assembler, I don't mind reverting it later if we end
up finding a user that does rely on ancient MaverickCrunch binaries
to run on future kernels.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
