Return-Path: <SRS0=ATq6=PO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44BBC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 21:04:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84A5860C4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Oct 2021 21:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84A5860C4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkHSibbgSMjyH6vCvm7Rl7dYEdmeTTH+fcJ21mRiC/c=; b=aOiF3ZvT1TeKG+
	+busABAXUHKNv4AMfJRuOQ074VRdB+QTiqfC2PsU0rgxv9Jybz4ukxZLTJfVSZncR4FaKQ+YobSmf
	8msospUDDdRrqViKAP0b4wWh9dZZi9eYgLJEnqET6/POVUfykbxWCVBbr2xKk73oHE5iWfn+HzVH5
	aQHX8UC1dyxSnNRIhcfWEwFotNkZqevFwu42cwfY51QaJKEkMSeLEIL3hT347Gg+yIVO7TTjmXwh+
	zzFo7hXklYr8o1S4pbKfPeE5eQNWPaZ92rMWmH+P5f3WcKhABcPfwgAS0Do5Pye/0I55116MZTMyy
	eHmahJcH7eL3foSPM9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfTbf-0034fh-SB; Tue, 26 Oct 2021 21:03:40 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfTbb-0034fE-Sa
 for linux-arm-kernel@lists.infradead.org; Tue, 26 Oct 2021 21:03:37 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id gh1so376763qvb.8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 26 Oct 2021 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XG5lbTjVQqOyn0s7cG0no6APYPSE1g9UuIJyOQ6ldbQ=;
 b=L0Q6Q39KF4ld5D0VLg4Foh6S7OmTuL4NUJHDlWVu8adgjXhgE4sPJgxkeNiiYrl8H5
 KprWsqQ8R8PY9IgEbm6QTvlQwatPzn6ZFHRV2claSzj4DnHUp5pIjWH8guAKZqsTVv9d
 UtXb4AQ8yTRsTAkMdaq0hFNvQubso2XBdKzvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XG5lbTjVQqOyn0s7cG0no6APYPSE1g9UuIJyOQ6ldbQ=;
 b=ciCkMFOAUapIChv9vxyco4tsbZIN/jM1Dfvq1Q4rO44eZNmLQj9IbS16xd+ClMa1b5
 pOegUKoR9zrFjCXZ8BinqbXzsLu6YxZI7T48YV1k6sIAg9TSlp6Vp6QmFU9Co0xMdD7p
 s7Z9dCff+Hk8sb3JC9e66tnoOcHMRS2BPeoaIH+NUYEdudmEYQc9gmSzZLkVETEqD82Y
 YM+LY54yE7+zdfM3pfsu8qd8LmGDBjGnaykcBChv8lYyfqqxUBdBscTBltFtV9oou832
 0phkRWlLwzS0YeyS69TX2uiQfE6+76p05E7GU/AVzoAcBo/A1s+hLpN4WoylSWPPf8rK
 eujA==
X-Gm-Message-State: AOAM531PVP+AICI1QSD+YkewDtsUbW3FxT/68qBc+B4DFM4N77niipx5
 Nuq4KT3h+lgTh530Ur4qG1Gfg77lLy09XIMYagg=
X-Google-Smtp-Source: ABdhPJyS+raPQ3RHzlakqcRijKe8IBgxi3FsZs0B+JL2VJIAV2O/RysAVQOh6SdhYJC6+oczNxVjX85+/VudRV6YotQ=
X-Received: by 2002:a0c:cdcd:: with SMTP id a13mr19072201qvn.27.1635282214282; 
 Tue, 26 Oct 2021 14:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211026200058.2183-1-aladyshev22@gmail.com>
In-Reply-To: <20211026200058.2183-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Oct 2021 21:03:22 +0000
Message-ID: <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add AMD DaytonaX BMC
To: Konstantin Aladyshev <aladyshev22@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_140336_176879_B7F4A26A 
X-CRM114-Status: GOOD (  13.08  )
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
Message-ID: <20211026210322.J2WcNrxAmUBi7J3uRmCdS9OYb1vmzuS9av8n6H75qYo@z>

Hello Konstantin,

On Tue, 26 Oct 2021 at 20:01, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
>
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

This looks good. I have one comment about the GPIOs below.

> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "","","FAULT_LED","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "CHASSIS_ID_BTN","","","","","","","",
> +       /*D0-D7*/       "","","ASSERT_BMC_READY","","","","","",
> +       /*E0-E7*/       "MON_P0_RST_BTN","ASSERT_RST_BTN","MON_P0_PWR_BTN","ASSERT_PWR_BTN","",
> +                       "MON_P0_PWR_GOOD","MON_PWROK","",

For systems that will run openbmc, we try to use naming conventions
from this document:

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

If a GPIO is missing from that doc I encourage you to add it.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
