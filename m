Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE8AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 23:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620FB6115A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 23:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 620FB6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gOvH/1shiL3YixsDuh3C9BnxKtAvH4f80Vq+DnyQnb8=; b=J+8IdFMMugYxQU
	c7UzI1IBN7fSerRuJiapIfMvv6YK6hy+q+ulMQCWtvNGtB3FoBnJ8eZTBsB2w9D1lYOWiuKf26nhp
	YHGi1YbFYeZlh2ASFW0T/0OUmY6y8BUZtV04zufR5j6DkDB0OohPzy5/xtceH+VZnErTMYAxuXw/S
	gkr+6iqrD04lZl5HJbKc55Y6H4eBBUBEadH6L5WkMzwXYSWUo5wlZ97Pt96YVrQd1G95e0ROr7CAQ
	kpOmnFjJUbAdxTUMH1EerjoZSP6w65WSa4jl7ETb6X7nxLQ71uHyEK3LaX+h8kWTnU5ZdbRfav3d5
	/k8XyyopQxJLHomsuLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlJ7Q-008wOl-5T; Thu, 11 Nov 2021 23:04:32 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlJ7K-008wNv-Pp
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 23:04:28 +0000
Received: by mail-pl1-f172.google.com with SMTP id u17so6917393plg.9
 for <linux-riscv@lists.infradead.org>; Thu, 11 Nov 2021 15:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CErV24ALLmtWHDv6Dg2Qhb0FOh3xq1Wa3w1/GJ4lZbo=;
 b=i7KjMpRHxDUT6yx0qmdrFgY2Izsrg3wg08HU1+ls/ZOVxg4NSZ4q0TfoxgGd/F6F+P
 TFra6L59bjxGWUVMVEttdvvSvn1SfJ7fe+IsZiqK1ZD4zgzJiqZ3GYAlyKuGuZQzb1Qx
 Q8MODOJ99el1/je9/GStEqK3lNBSIcXX3fiiQXyHA1QXx8cIoedavy78ddnDZTNj6Eh6
 0h72dQbe2ES0Ogz9DLG2EslFlcd6qPnhEGQRrsdneTrq7m/4oqkmI1/zWPMkSHkdeNGJ
 K0CSU+jDj3Dl4BFVQWuPFigFCRbj/Ic7H5Axh+eaCj9TO25ji4rVGx7wfbuM+sx894OJ
 EQhg==
X-Gm-Message-State: AOAM530iU8ZnU3cz2B4FFV1kkg/SDkIaMXWp884/n17U0DLhOR1zIF0F
 bVUbBED/gKs2Ybv7YmSEYY5DzMsVKhAStHAu+ts=
X-Google-Smtp-Source: ABdhPJwDbzrsxKzE9i1z6gPeh3fpqAXyMhqZWJsKWQps8Fb82bOoN9fZpAP7ITZ8MQCrDHMRtOBbF32CeFI5d3+zvz0=
X-Received: by 2002:a17:902:728e:b0:143:a388:868b with SMTP id
 d14-20020a170902728e00b00143a388868bmr2600284pll.33.1636671862963; Thu, 11
 Nov 2021 15:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-12-kernel@esmil.dk>
 <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
In-Reply-To: <CACRpkdb0CrJ_uTbtfg-xGq8uu0AKoqfAB03mF2CA_G8ys_8Lzg@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Fri, 12 Nov 2021 00:04:11 +0100
Message-ID: <CANBLGcwvGptHxP5+JQEQV1Y7G=dNTt86QuVgfUuvQDDBfNrzOA@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
To: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, soc@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_150426_866029_34380B6E 
X-CRM114-Status: GOOD (  18.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20211111230411.P6pZpzcQkt9EWuqzYqzcHwbe0gGH2HszPc-B-CUpHiE@z>

On Tue, 9 Nov 2021 at 01:46, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 2, 2021 at 5:12 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > Add bindings for the GPIO/pin controller on the JH7100 RISC-V SoC by
> > StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> >
> > @Linus: I'm really struggling to find a good way to describe how pin
> > muxing works on the JH7100. As you can see I've now resorted to
> > ascii-art to try to explain it, but please let me know if it's still
> > unclear.
>
> This looks perfectly acceptable to me:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you.

> As it appears to have some cross dependencies I assume
> it will be merged through the SoC tree?

I don't know. I've never tried this before, so whatever is easiest I
guess. Do I do anything special other than cc'ing soc@kernel.org for
v4 to make that happen?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
