Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE25C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 23:45:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D419610CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 23:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D419610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FAFlou8d3lmlT9W7FhFZvZ9rT12r/IbdFIjdOGQuqk8=; b=ev+d/KsxHZYO4N
	hX9Fq77q+65IHQMVpOvuVE5zbngEYsOxeHtzyTSjvrGeGDjM8Y51z+zedvPLrU8Kd242zVyyxrS/q
	ZLN+4SbxBjTKPxbIm+ch+3+Tjq1CxsC0RWj3nJfIenLRLSXAXklKYxboGlGmPMLweh0hDE0BT0taV
	rdzxAl9k8QSfyHdNxkTCmJ3CgXVXWp0tCAsVszM9TiCy3Tw81IN7tWvgH4zd2hzrx018061vctvHB
	0SwWFHCH4wnF4l0jFCZ440ueWioEN69pA/mdmZLI9/Os8J53DNEYFERYZ5ffpmKZJtVETZPPs5IVv
	DWPGGI8df/D7S0LfWsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1manuE-00148y-F2; Wed, 13 Oct 2021 23:43:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1manuA-001484-G9
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 23:43:27 +0000
Received: by mail-ed1-x536.google.com with SMTP id y12so17295376eda.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 16:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=70WgJz68301W4YAWeUnEt0QpDAyQBF+Qn8eRADlWcZg=;
 b=tZA9wgJTf8LhUZogPP5QfxAXUuLBr2snIF0TIThAd0bHlqMQg/8FW01FUEIuqdBi5P
 sqOZmZsU9vrBPGuqMaXAwnnljLuKj+cCGBSN5KqI+oDmc7+7Mc4ivT+v2zMVGgbnqY6R
 6x+HYqb8EoKh7wvACzBGViDQp2DNhIu/rhZnE+uIsNc/ysxbBZsoRoBAVuVEq7tg/Dcu
 aUtNBspxTrzkAV8rhuJaKqGKRPdfAY18gY2iZvVF3SGv63AMGLwsW6VrGTrsMb0u0MWT
 O/O4fkqgv4o4JsR0n/2hco/6stuJ4d1sWpMRRAH0k/Ela+yIYHNedsfxDn+eMaud4bhM
 /4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=70WgJz68301W4YAWeUnEt0QpDAyQBF+Qn8eRADlWcZg=;
 b=Ty6wO8S7Pir/p7vX++GRVQSgQavnKvOpJBKFfsRkfzaR3WOgYVELY8f48/fU4wgGjW
 Qg4HWkIejpK7jLNVfJ1e9L/BSapdxfi0prf9pnBtnq35HvkXazqikELs2O1tI5YUUnoI
 cKTFlD62O22UfIGTQbwk0u5wvTzznSYc0t9yAkinLV/E/pLcOL01fZYa/LsVGUbf2Z7U
 quWOmKMkNa6HsaI4a8ukTor9hYX7QCbfThO1yufmyF2LAzR6pSORO+7vN1bBJF26d9bd
 e4sR4tPiTIV5/CzQEC9EX5FYJSQy6wLFtFRJ5ORQ1IE7rf158KuFs+g2dO3si5lLnwX8
 zkYA==
X-Gm-Message-State: AOAM532inTPNn0CK97BZlTMXWo1T0Wybj5m9RK9uOiL0uCrv7zlWsrAg
 JgzEie8mNk5AxCwl2svi8bRiv9wTACj2RliTbMqvOA==
X-Google-Smtp-Source: ABdhPJxUMstUt73PfXbllHC9NHBVobh37BXe7qV1Bk73wDAlJ9lF1d+353wJ5XQjmhvwV9GfreivHf/BEnZFxTyfbZg=
X-Received: by 2002:a05:6402:34f:: with SMTP id
 r15mr3664494edw.111.1634168605027; 
 Wed, 13 Oct 2021 16:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
In-Reply-To: <20211013143810.2101838-1-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Oct 2021 01:43:14 +0200
Message-ID: <CACRpkdbbZo1VUk1yBWuuEswiThf5Vrbgq0SFo07Z_FMy4vvibw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 SoC Team <soc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_164326_597524_9B997A40 
X-CRM114-Status: GOOD (  12.60  )
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
Message-ID: <20211013234314.W5p7gfBueySxPRt8Fd8B8o35myHIxRU4SNzeB95W8a8@z>

On Wed, Oct 13, 2021 at 4:38 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> dtc now warns for the LED nodes on the versatile-ab board:
>
> versatile-ab.dts:126.12-132.5: Warning (unit_address_format): /core-module@10000000/led@08.7: unit name should not have leading 0s
> versatile-ab-ib2.dts:17.12-24.5: Warning (unit_address_format): /syscon@27000000/led@00.4: unit name should not have leading 0s
>
> Remove the extra zeroes.
>
> Fixes: 07ebfa59b9db ("ARM: versatile: add the syscon LEDs to the DT")
> Fixes: 7fbe5f7ff267 ("ARM: dts: Add Versatile IB2 device tree")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Fair enough,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can you apply/send this directly to the SoC tree?
I don't have any other changes for Versatile this merge
window.

Yours,
Linus Walleij

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
