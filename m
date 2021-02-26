Return-Path: <SRS0=yS1I=H4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81455C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 18:02:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC3764F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Feb 2021 18:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC3764F1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=spsIEiyvkt1ThybX3a8gRoUYOi5a8/QAw23vdGqAyl0=; b=ajx4TEBMua0+vObGqDm1s9nuL
	VYyKfqyYneRn+BXn4of9HFpqTa+Zxwr1Sj6gEYUMExGMuXWkM3B5la3gQ8O/xMFQrE5nbkXxQP3yC
	qYuXLREGtkgAj9kauupV7xFR88yBqMsOW7AXyqJPxaamDf97YeKaK4xVbbQMhP+prn8M5VlPLujnD
	xvx98d9OpNG0eJD6oMea2iklfDeNVu6hBhzIxzoa4LuEV1DQaHePhaKYx7FtDpAnwlq6Uri9fiIp9
	7mZ5/lnt4+UeNbebSImqPLvg8pFnKQGSoFN4Uf7K5vgLN/Fj/eZBQ/ollvfYzEeW9Gu3SWKLEu8c1
	nyuqHh9YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFhQT-0001bj-UD; Fri, 26 Feb 2021 18:01:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFhQR-0001bP-3G
 for linux-arm-kernel@lists.infradead.org; Fri, 26 Feb 2021 18:01:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15A6664F03
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 26 Feb 2021 18:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614362474;
 bh=K7ckSsBdRk9rkAeryus+c3Q4PuQkK1Uq+V7iFTKfGwE=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=DO3RSA62JjU1Rhi6oOfMEnru7cpXgSdRZ1pFYq/VXa/Dw1Op9KXTeTU3TZbDgGw2p
 mydKgZeeJ+LHX6MyBdDcFtV+eZOb8131rzknEi2AFbPlrWk5K37TU6VSomvV73dxgU
 AB9HY8elug/cpRQ1rlju37hq70BDJDRsnrT2g0GqPGQ6nXwEhVLO5lid91WCfuNXZ7
 BnS+mdMZGv4dD2OBD3r/C3YV+7bbGNFSx9EjLc/V1A9s/SUeW5E5zMyy/HtJ+GFrQj
 nUQksCQpKcPD9y5C1VH8W37KXDRQI/mfDkw9ZXtw8hcFdHj8U/INvDrZT4SyWMaeYZ
 w+Kssb1JEpTIw==
Received: by mail-oi1-f178.google.com with SMTP id l133so10591134oib.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 26 Feb 2021 10:01:14 -0800 (PST)
X-Gm-Message-State: AOAM530lTXFNMm5434CNZ0d3cNP3Et/fgsV9qFBom1MjhtG2TYQrRXQw
 Ee9sQG5oypdllEW3Z7lk/jZaSuJlCoBxt+UnxO8=
X-Google-Smtp-Source: ABdhPJzAqTkX5+PkGxMg1asdXRKWTDALsdIgq1ACEq8X71dP5w1l3DcYrd6GMc0V94kFGbIQ7FtZiXLmCBrwteJV7LM=
X-Received: by 2002:aca:4a47:: with SMTP id x68mr2769592oia.67.1614362473428; 
 Fri, 26 Feb 2021 10:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210226164345.3889993-1-arnd@kernel.org>
In-Reply-To: <20210226164345.3889993-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 26 Feb 2021 19:00:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
Message-ID: <CAK8P3a2E0pv6PKzcCoRZH0G_gGrhWeiDwN7h090iQpd6c=XG1Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: ep93xx: don't use clang IAS for crunch
To: Hartley Sweeten <hsweeten@visionengravers.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_130115_250787_ABF98916 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210226180056.Lo_Q1xPwk5sGzYUtSaDMth2mhQZoyzODBHeT1pFexSw@z>

On Fri, Feb 26, 2021 at 5:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
>  obj-$(CONFIG_CRUNCH)           += crunch.o crunch-bits.o
> -AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312
> +AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(cc-option, -fno-integrated-as)

I reworked that patch just before sending it out, and ended up with two typos
in there, it should be

+AFLAGS_crunch-bits.o           := -Wa,-mcpu=ep9312 $(call cc-option,
-no-integrated-as)

I'll wait for others to comment before I send the fixed version.

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
