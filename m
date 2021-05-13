Return-Path: <SRS0=VKAG=KI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D25C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 May 2021 03:41:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E7E61411
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 May 2021 03:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6E7E61411
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NmAMehgILptft+wMEPLrmRysLFyqq5Kdf4WGn/FUod4=; b=PrG25LfzG44vDh6pvfxRgTuh1
	GKF2Ry3altH4inlx8ePNsSG0DGAcV/Z038xdNf0hVEwdqIQmnGGwoihEFRMTD/93hf6MJqTQby425
	im8BKwBzuAS2B0vn/64OSd63c15jlcAQdXDDp+RxRjtWBx8YJTlXx3w1FY2ATp2i/NcfQ+qPMbU29
	9rgMn/XzwJtxYo3p9vLkNP1LDgb3tmefeDS8l03qLikAJ4hgRbNLL1kMU49ifV+Ld7M3/qr6+Mw+f
	UhO0O4p/ZPLCgni3GKiS8TXLTZR8aMJPHN6CHs6iDjEpO2VTaoHwdmIdUEQkN6Eobj5kPNY8zrwa0
	FLlZ5AA3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh2Cw-004dXI-TM; Thu, 13 May 2021 03:40:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh2Cs-004dWl-QF
 for linux-arm-kernel@desiato.infradead.org; Thu, 13 May 2021 03:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3jHbxGEk+NfamdZI7bZ+YwLZ9JV9C8j1x89unilxGCM=; b=LBl6jLxcs6+mn9TTdx37R9ubrW
 eVtO0C4VcLWLv/p8gdrgBzEo5d7WVQ93rbUfx9OkYNU+QGwcAh6K82RFR+etj+S3sNFA9TDlnKwRe
 HW0lQabvTbBEr35M9ny57gjZ14vhwiv4Xyxtr++pYFYZIW+Uitoo4h9Zbsgx8ARefEOZRoW7YCaFs
 mBPuo+LKiDULhkKFTW3bDRO+QL8q+efchoc9EwVckYT+f/gP1Fx02tUd9f6Z5fJFrNRCMLg10rvWy
 p148orb93/+YItLfrKGgiQ4V+c9ZS9Nc/zvLWf7Fhdzzt5Hwm+qbH6NS+hZM4Z4asb5I26jreTEGc
 3ecPXOOg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh2Cq-00AzIB-AD
 for linux-arm-kernel@lists.infradead.org; Thu, 13 May 2021 03:40:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B89FF61419
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 13 May 2021 03:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620877211;
 bh=/Z3ZsC9rjLJYlaHrIESz3z1PcCsLIZtNc3hRRQinbpo=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=V6+w7Z/RMSyJLvsrnbqkxN1nDuc63u0jRnx7uZ2ZIvmijli3nFDGhT0Xf3oe/GyU1
 JJJSg4AKaLPzTvvhBlteknlwseSb012b8suIzhVG5jjKmxezsBMpIpobzN39SCl6v7
 h6G3uCON4RDZwRsLOyHpnj0KNlLTR19R6PiDHrkZLrWoyH771Sqb/mgq/hqBbh3o+r
 WsTKXZgGcWbOh7sgwDhJa+8oCJW/0H/U16jcuI9jYZe+jh7MUje0vrO67aCam1A4q9
 S26SNTqYKWO74X0LpnzpsPgqxgWU1bjZmipRT2Md4st41YNwB54fQLzuEUQhLk9393
 8b5Dl314ABHkg==
Received: by mail-oi1-f176.google.com with SMTP id j75so24171524oih.10
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 12 May 2021 20:40:11 -0700 (PDT)
X-Gm-Message-State: AOAM530+kBEZUjwHIsx4CG1tWIcHEHhykTHg+fne8GUlbvK0T2AmnJcO
 7fqfJmreN2RabVoZsJbhExCuMqdWNym742vLj+Q=
X-Google-Smtp-Source: ABdhPJwcwtRAr0oZXrAx2M2bBEyduqWP0+i20vscS5lDLyNr4S3gsDmq0dYMWxo4mvltVdjrUw1EUj4TApscAPYusf4=
X-Received: by 2002:aca:d658:: with SMTP id n85mr16261397oig.80.1620877211016; 
 Wed, 12 May 2021 20:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210409122036.31628-1-lukma@denx.de>
 <20210513033631.GL3425@dragon>
In-Reply-To: <20210513033631.GL3425@dragon>
From: Shawn Guo <shawnguo@kernel.org>
Date: Thu, 13 May 2021 11:40:00 +0800
X-Gmail-Original-Message-ID: <CAJBJ56K1SsaAFDTaOr-b2shDayYJnoMCeHdcHw85FunwKPfcjw@mail.gmail.com>
Message-ID: <CAJBJ56K1SsaAFDTaOr-b2shDayYJnoMCeHdcHw85FunwKPfcjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx28: Add DTS description of imx28 based
 XEA board
To: Lukasz Majewski <lukma@denx.de>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_204012_389765_DAF07F52 
X-CRM114-Status: UNSURE (   9.44  )
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
Message-ID: <20210513034000.W0vld_RJHQaZ4Nk6uYwf7lnjf90_dQZsvel9voZhA-g@z>

On Thu, May 13, 2021 at 11:36 AM Shawn Guo <shawnguo@kernel.org> wrote:
> > +/ {
> > +     compatible = "lwn,imx28-xea", "fsl,imx28";
>
> Compatible needs to be documented.

Ignore this comment.

Shawn

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
