Return-Path: <SRS0=aU5H=GN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B235AC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Jan 2021 16:14:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B87B229C7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Jan 2021 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B87B229C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G0stiG190I5MpqvhcFuobDx6VPffuECy7vWaiXFcFVE=; b=P5cWNlE9liPAK1upiuxCREpu9
	ydh/MdmH0Fbr9BVAisg8GjX0ZmBmq0vseXiU1wr7GyiLR0r1W1cCRpgj+ZoJb3q+OUYUwJo3trmWo
	kYRRS7xurUXsXgbcQ/hRICUgEAgLMytl7glk8D6S0bJ8oedf+Pc4sGO1nGdqTobyWW7AnEhSzpO8S
	w5rNuFhOTSbu6XIsfDnVo0k4ijIqf7Qr0dRijzZt3RKaLLF6adiTfwyKopsjfRfKgSqQOpg1IHO9F
	sl+CBuH2MTiPz/JGrx0SqR0ITFc1oWuRIftpjTQT0XPIdH4hlS7MbmFBJX8LOxfPj5/K5p9OBBzG0
	KmM39p24g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kydKj-0002vQ-0D; Sun, 10 Jan 2021 16:12:49 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kydKf-0002uF-P4
 for linux-arm-kernel@lists.infradead.org; Sun, 10 Jan 2021 16:12:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id c7so16290064edv.6
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 10 Jan 2021 08:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Pkhzx66anNUURuXnoFRsV190plIqgcKOBoJUhFMocmU=;
 b=K+2hL02iuYOFg8kd0ZklVzbG/O4T9mljkKBUB1YX2jlvfzJ4uQD6Az6MyyUjAmdQJC
 Z//XO6w/rr0pDXzx/ThnqeNmaUsx7HKZ1azaVYOHoYXCNMHAwp7uPdEr91mGa+awx6ha
 yBjewBAJuEttZfef5AO1tkY9NyFE1jq54DjDWu+c7haeoH4CPutgBNR7mpO9GkLXTiJs
 K9HH+qxZuT8AvRpq14x2Q/FgYRWwKPRu6WQcOIl2Z3Sd37QguE1wTMSkHGlJyyFw7W+y
 egvNWe7FYngTuFauHvcUZWkQNsNJuHuwck4P8GI/IE9+KpO09MdExL+nMI+kHsxIR2+J
 tA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pkhzx66anNUURuXnoFRsV190plIqgcKOBoJUhFMocmU=;
 b=mjnzr2gEP219aEggIAbI4G5aNE7TjMq207uFSWOb8K62C6u7WTriKBUfxdmPy7g4z9
 kyNs/51oVPUmnpRTcbknruNfCIhfSjv+DM7gMoAgD5jgevqgR7fLI1YLbDh+1hRntUmT
 AyUGfan+o454pQgCt715xYpSG3z03YkVB9+ZF0FHd/mKBfkDZHPxVcr1sUOLTX1iaGnZ
 DypzhYVo8VEVnI6jPP5e2cLQSsBazFbcu5zgiAGZir8yB0II/WKIQtOJQBqJYt1TXZIa
 KBWgsijOhOZI7C86uUMHAtdVF+xMydCr/+67hXByGZYFUb0Y7q+dBpABSvtnOvOuD9uq
 HTsw==
X-Gm-Message-State: AOAM5311s0bAVOPNedCx6iNDk0Al5ynq8xzrzArZRK3x76KdHLCvq8HS
 PleZS9IvNVe6aTIJi/1RZdc=
X-Google-Smtp-Source: ABdhPJz4NlXIH44Up6kriEihCMzY49jx4itdsN3hhYT71mxqlsAmJRROm2hnw0VwJGDR/pPev9+yNg==
X-Received: by 2002:a50:f089:: with SMTP id v9mr11933883edl.353.1610295163130; 
 Sun, 10 Jan 2021 08:12:43 -0800 (PST)
Received: from localhost (ip1f10d3e8.dynamic.kabel-deutschland.de.
 [31.16.211.232])
 by smtp.gmail.com with ESMTPSA id t12sm6534378edy.49.2021.01.10.08.12.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Jan 2021 08:12:42 -0800 (PST)
Date: Sun, 10 Jan 2021 17:12:32 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v8 2/3] ARM: dts: Add support for i.MX6 UltraLite DART
 Variscite Customboard
Message-ID: <20210110161232.GB7264@ripley>
References: <1610144511-19018-1-git-send-email-oliver.graute@gmail.com>
 <1610144511-19018-3-git-send-email-oliver.graute@gmail.com>
 <CAOMZO5AGro=rGTPV0CAWPh_=Q9KqCYWO199FWn57xBc=eUWdog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5AGro=rGTPV0CAWPh_=Q9KqCYWO199FWn57xBc=eUWdog@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_111245_980719_FBE22B81 
X-CRM114-Status: GOOD (  14.62  )
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
 <devicetree@vger.kernel.org>, parthitce@gmail.com,
 Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Marco Felsch <m.felsch@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210110161232.1bEup_N8VHLE-bPlj8g1mKbRYB_O3_HYrrCt2F1ySuE@z>

On 09/01/21, Fabio Estevam wrote:
> On Fri, Jan 8, 2021 at 7:23 PM Oliver Graute <oliver.graute@gmail.com> wrote:
> 
> > +       panel1: panel-lcd {
> > +               compatible = "sgd,gktw70sdad1sd";
> > +
> > +               backlight = <&backlight_lcd>;
> > +               power-supply = <&reg_touch_3v3>;
> > +               label = "gktw70sdad1sd";
> > +
> > +               display-timing {
> 
> If you pass the compatible, then you don't need to add the
> display-timing in the device tree.

thx I`ll drop it

Best Regards,

Oliver

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
