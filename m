Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62075C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 18:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FD0D61101
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 18:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FD0D61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euA8Vv1eKvs9cTle5DB0arZ84jJp0L3YhMutly1ih9U=; b=oXx3Nuj3K5AVj6
	Hk6brGddpbEjtfi0kQV7k6yciTohFV44EmqHVko5I2QwHUL61rFQbfuwShbDlsvWXNJ1CG3sWkjem
	3Bnxs+EG9EG0lS1VsCDefcKSkBLYJEVIxx2+AUt23z1oR7OXucdlmdMQH/z9veK1xw+FP3nkYF/dZ
	DOELLs7HaCxxQfCnYcSRgYuAcSiMac6hSKCKt1mnoavnEJEhwnjXpiy6eSRH9CRfaPoVu7WvkP5Mh
	hFTcnNt2sj+PaSHHI80WW3KeWa1WDxh0jq13kM9rp6Th0vlf4uJ/Mol3FTpxUIvbiofeRZ3p4T3gs
	Qk2cORPEm4Tt9E1QHTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKXx-0064CP-UU; Wed, 03 Nov 2021 17:59:39 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miKQ0-0061eW-Ep
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 17:51:25 +0000
Received: by mail-ua1-x92e.google.com with SMTP id i6so5947410uae.6
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Nov 2021 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y16TxmkBvfqZgNLIXU85g39fksG0Qn9oks7FAgvFiCM=;
 b=fPXyM8mzP3xvv8wh3rn4V3uaO87BNrn0AJ9Qk+6md27hPqHI7elIBnRFfZrMbkrB8z
 HMRAMWtnw0XtczVwAoKFJVJIdYOkvt8HQYEM8C6xTdZXiSzf4OZxmxoe6Y08fRhREPSJ
 XIWi2Lh6dvIz44V28gaJTn+LjOAiatp6weuHgHr8HN783Bom+vt60CdU1nql8hJzFwAf
 8xk0AzN3X2eOPziruIBW+zMsjC7zIG02FuAJFh5F++waTBxWkxxKZf6WCNIdprizOMbW
 Xm+0CZZTDVOgSmjSd7lFoDAmPZFRD0BUunnY1+vhJaIeWPGb9aoKk/6xNIoKE9mP9EBy
 QQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y16TxmkBvfqZgNLIXU85g39fksG0Qn9oks7FAgvFiCM=;
 b=N3PI7SJ9p2VblMCEhGjM8g0cBz3nr7LQvdz8GuRVp/xGJApYzGUgz9X6IQ8QH6SxA2
 gj68VlI2CGeVhlump+7ojE5ruSuMtJsJOrgL5sMd4S22yguAKdrClQHcM7SukojgijvW
 mc9ket1ww3gi/XG5udq7fMsdqYAv/nEup1e920mRAmqJvxIMFcwtCP01acce3ZVpNs49
 Rf5M5geE9T96TsX3KuygNzOmxJ2cMfXAAe4Ru0fk5RcQT8j6GzjJtdODEHrRzkJgK7qC
 y33R+R1tltktmOyx3dBhde+IHEhMoCBN7aEB7CxDclYEKLO0RylN5VS5Z3r945uSkHGZ
 6KuQ==
X-Gm-Message-State: AOAM532Iq13W7j+hKo0ILxsQJ4lyTp2o+TU89FeXnD6DXF1SNFqgx0af
 8Re5NTcbri2qulGEJkaYCV0qcct4jaPy8I5zBjk=
X-Google-Smtp-Source: ABdhPJx8cB1VYKTTJlveYA1FJ28sZ0zZeouC+gUZUYrWW2QvfiO2tYkKYYUUJqVe1q+ewdOqhm9/EvWuL40E8vwi7uo=
X-Received: by 2002:ab0:6ca7:: with SMTP id j7mr39236673uaa.133.1635961882870; 
 Wed, 03 Nov 2021 10:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
 <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
 <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
In-Reply-To: <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 3 Nov 2021 14:51:12 -0300
Message-ID: <CAOMZO5DHCYaxzSASKq6Bk8ALkiQeVjPOHOyk-pKYepJFJk6oFQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Abel Vesa <abel.vesa@nxp.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_105124_550009_C45BD5F8 
X-CRM114-Status: GOOD (  13.92  )
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
Message-ID: <20211103175112.-V7UrJyD1pta1cUgcA416hqGIJCXkrGjSd1S0E8tLsI@z>

Hi Giulio,

On Tue, Nov 2, 2021 at 8:30 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:

> If we add every SoC we will end up having a long list for every device
> driver. At the moment it would be 7 parts:
> 1) imxrt1020
> 2) imxrt1024
> .
> .
> .
> 7) imxrt1170
>
> Is it ok anyway?

As this patch adds the support for imxrt1050, I would go with
"fsl,imxrt1050-usdhc" for now.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
