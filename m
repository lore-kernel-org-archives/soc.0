Return-Path: <SRS0=3r8u=P4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B292EC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Nov 2021 01:35:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 762C7610A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Nov 2021 01:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 762C7610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3Qbs0BfmjOEiiLPhSh3CmxvwtFB5EIFBrmz3SbqZ4U=; b=0/M13AH2YwWC2K
	uMe/HHbxTI1Qz2fS/NwX4aBNUnfmRxAda5O0KZqdjBRfpTFNUE6LKS/nU7TdGw/Kcnps8by1bOHcA
	6g9Dp55yju2HjYBeRjE4Lvpjsx0/D1vML2AuRdLmr4bckRkrTxiNpFP+9/10oacFEGZIepGy9Pe3j
	VtMCxE79rE6WPdBQHbus9jqKcBsEODjwZ6Vh0gOPKL2T4rzIfAU3Nq5ZBzVeDyCB+tlhwMlTcdDGe
	Ul9JtSFoKPx3aV98I6NrsDmFfDOPCF0UkyGKY8Hz+VVFB+HQGOIKeUKk9xkHWReWLK54VRkpVXlM9
	RVGgqvmtW088+oFpY8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkG0j-000N9h-E8; Tue, 09 Nov 2021 01:33:18 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkFbi-000Dgn-EM
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Nov 2021 01:07:27 +0000
Received: by mail-oo1-xc35.google.com with SMTP id
 z11-20020a4a870b000000b002b883011c77so6471788ooh.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Nov 2021 17:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ednwC4rk+fMRoZ56y8enAsmD1OcJ155WuvM3vrzbF0g=;
 b=kW2VZKXq10e3+j2pN2rREnvfGn/ed2pBKv/FDDZGYkiJ1B/Tm+e592rBZOssvxp1nL
 lJ8uNMknOuWUpEbsMD9f5YGmpAyp6iPS1isss6b24feSEfiOdZDz5BB1kClvWeRx3m+k
 nSKJo7mf0P6cENwhEMcYQl79zQf2G4kpxcTjF8qti3XLvenzR4E8B9owfJGlT5swp/tO
 0E211Heecg5kaSUuT4hqK7LMmN/Dv9ANQuL2x50Vl2dhZTV7X4DyPTdhV7FFap/gkuZA
 a7curh+yVVMTtyUoMlA9s4fMN4nseVOWXU0tC4BMuT7AR0lvBWHgKVcMoJw8R1BKkXeI
 mtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ednwC4rk+fMRoZ56y8enAsmD1OcJ155WuvM3vrzbF0g=;
 b=AhhEphX+f48sU74Nu4djdZCopv50xRxuL6lipOY9RXl68n2Yma+0vh7CBs2QIVTs7o
 gEkmv69ruSdvAQ2tUp6eIq+eCZrJTehsqSo34Qs07C0W7PdYTAuWEoNHqBWD6Tq5OuUc
 iywLCpstfMxgpnbf4IRUVacF7XfQ+5lFqe3rt1N4dinWYIroeEEjNTDEyu3pJXa43ZOG
 LY6N+VUd2Q8ZA0NXrktD4pCEHIKDHmm7PgBhePUEyIn8MS+hLAOqJGj0yhnjOUoj1D4x
 HErYpGrstPtIIiiR9XIXjWj/CBHToddra6U0NV91pvXqZoQNh+7bqPd5RbVlQaTBzVBg
 /syg==
X-Gm-Message-State: AOAM5323AxxVEkus7JRRsWb3uX7TGHMyMj+HdhWWPk7PD5u60MG3Z2ek
 J/orjOl4Jab3hf3XUSaz1OHFTUnG+3OEZ4h61uIfBA==
X-Google-Smtp-Source: ABdhPJxZSqASgOxakIs7bpwXgWYlDpKIrlNu94fm32sHo3EvuzrjMEZORAzZOMFOE3CUot1IZlKvoozayP2kRdmgAXQ=
X-Received: by 2002:a4a:e5cd:: with SMTP id r13mr1831608oov.84.1636420045513; 
 Mon, 08 Nov 2021 17:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-3-Mr.Bossman075@gmail.com>
 <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
 <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
In-Reply-To: <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Nov 2021 02:07:14 +0100
Message-ID: <CACRpkda9e8FtjR3XB97Lu8X5=yeApk==4+zSqo3Qp6bWxgJAcw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh@kernel.org>, mturquette@baylibre.com,
 aisheng.dong@nxp.com, 
 linux@armlinux.org.uk, s.hauer@pengutronix.de, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, adrian.hunter@intel.com, 
 linux-mmc@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org, 
 linux-serial@vger.kernel.org, jirislaby@kernel.org, robh+dt@kernel.org, 
 abel.vesa@nxp.com, festevam@gmail.com, ulf.hansson@linaro.org, 
 linux-kernel@vger.kernel.org, stefan@agner.ch, olof@lixom.net, 
 sboyd@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, 
 arnd@arndb.de, devicetree@vger.kernel.org, linux-imx@nxp.com, soc@kernel.org, 
 gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_170726_517187_BD47F454 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211109010714.33dkBJgSjaF-da52OEvfAKT2b-Vd4LzzAhHA378n42U@z>

On Wed, Nov 3, 2021 at 2:38 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Ah I thought it would stop make at error i see it now, is there a way to
> do one file.

Yes:

make dt_binding_check DT_SCHEMA_FILES=Documentation/...

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
