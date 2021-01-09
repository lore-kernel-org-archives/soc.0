Return-Path: <SRS0=Rxia=GM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5B2C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Jan 2021 19:56:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3531D235DD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Jan 2021 19:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3531D235DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KOmHGUe48enmwJQAPmt7EWozU8Vo4sznDyJH9h0/iek=; b=Q2swac3M2hTbq+FZkiCn5z47g
	IOnSTL3SDM6z1mnsoHwPq2Bra8E/PBFQ3dwBr3lBG0OJUaSNcmtlUZN7HnYpXBXhn6sFTKI2n978A
	H2Rksj6AHKrineemFq51luTG9OpJ4k0RfxrLChSdJNVwtXjwW1lrDJkwaaXm15Hxavcgs30jP1+aL
	o+v8QTslyoKNAKfhoXIgeFBxjTo081LexSfy96rbbnCENFdmbRi2Mz9kenDH+++JV3s8LpFzo1EFv
	Yh1tm1bP1a9ed2fjdFtUz2F8pR/YsOZqO4tNBAVQLhalqZdbg4Cf71nsPseLNOJGx7H1TfGSBNeDx
	2RN2EH4ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyKIh-0003hN-1V; Sat, 09 Jan 2021 19:53:27 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyKIY-0003fo-DG
 for linux-arm-kernel@lists.infradead.org; Sat, 09 Jan 2021 19:53:19 +0000
Received: by mail-lf1-x12f.google.com with SMTP id o13so31369418lfr.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 09 Jan 2021 11:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cl+kCq9RgNjHFtJ0jMkOqkZFX0EZ3i6SD4sOc9QasOE=;
 b=A2vHOYTcitTVq1idzX6qJHQ0ZeGNGVZ01Fhfv7n4B8YNp8436zDaEefui8g3Bh8DcA
 bG2+5Jk+vWvS6MopTUqfgIjt0kij4kE/8SGjPXdPXlI6AIK9VJfm+aPd0cGs0AFdICxd
 eygbNr4OL2Hkp+v+YsVgpBsrny30pd7j0UZ5hPAt1etVHYoSeVSjKbqWOIe7VzW5fT46
 q0l85ZTiE1x8S7PnX2ujkqykHCt+g7zN6YFz1xBFjf9TiIF/xC2gLzR+xys+X0ni6MRk
 H2arIS7UJehZLSPhyatw1QkZml1kex9+2DQql9RGpuP3iKJNN3OdKtmsgyP98BdFCnNC
 +VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cl+kCq9RgNjHFtJ0jMkOqkZFX0EZ3i6SD4sOc9QasOE=;
 b=ShelqRABmB7yCx9OoAZVzKIn8q9Elwcya7ca7EhI6iU+Ch1KEHYkPlhGOkN1OH9/EK
 +RRreuchz5yTwdYq7sWvBXO8hjVmeRDXKuvtCVEFKFeOe48idh52Siy73fDrPBKIq0hX
 yZSKfqlV6HqHH81rdtkuiceaRrFCE4mE6cGTGgqjbmvuJXQVeOk6v8NL4kmJYERV5n5+
 0/3i1b2MMOyFEYzaJHPF0lTTw2mBUGsDs/VK33PUFUwB9kfsrEIh9Qeiju9fKQH1zVPH
 i+PRSh93uszf5F8odgcMIbP8tlZFtEWQD2vBolenwi/F5FOJl4pbq0Q5ZShfPNoo737K
 rUJQ==
X-Gm-Message-State: AOAM531DChgfQvWHyb4I/JuKqIBiWMMScVG3g0aGcBhCtQ+dTovWyFqj
 7gDBBbZ0TLB1ERZ69LmBUptdOzAXvGfs4ttC/OE=
X-Google-Smtp-Source: ABdhPJzU1r2eTx3+DSxC1CZupRwItg9PZXkK2YTXlGkB10rcIe0vN6ZbKdYWFs0pXmzFjK5gqvhzT0eUA5VBrbbEbe4=
X-Received: by 2002:a19:e20a:: with SMTP id z10mr4568621lfg.295.1610221996906; 
 Sat, 09 Jan 2021 11:53:16 -0800 (PST)
MIME-Version: 1.0
References: <1610144511-19018-1-git-send-email-oliver.graute@gmail.com>
 <1610144511-19018-3-git-send-email-oliver.graute@gmail.com>
In-Reply-To: <1610144511-19018-3-git-send-email-oliver.graute@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 9 Jan 2021 16:53:05 -0300
Message-ID: <CAOMZO5AGro=rGTPV0CAWPh_=Q9KqCYWO199FWn57xBc=eUWdog@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] ARM: dts: Add support for i.MX6 UltraLite DART
 Variscite Customboard
To: Oliver Graute <oliver.graute@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_145318_677217_B4A79A15 
X-CRM114-Status: GOOD (  10.66  )
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
Message-ID: <20210109195305.5D23rt773AYQhlBvUE8YmXAdOl09ugO8seHZ3MGCdgs@z>

On Fri, Jan 8, 2021 at 7:23 PM Oliver Graute <oliver.graute@gmail.com> wrote:

> +       panel1: panel-lcd {
> +               compatible = "sgd,gktw70sdad1sd";
> +
> +               backlight = <&backlight_lcd>;
> +               power-supply = <&reg_touch_3v3>;
> +               label = "gktw70sdad1sd";
> +
> +               display-timing {

If you pass the compatible, then you don't need to add the
display-timing in the device tree.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
