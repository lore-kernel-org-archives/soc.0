Return-Path: <SRS0=Dab8=7N=gmail.com=error27@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0952FC74A5B
	for <soc@archiver.kernel.org>; Tue, 21 Mar 2023 09:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7F85C4339B; Tue, 21 Mar 2023 09:29:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B084FC433EF
	for <soc@kernel.org>; Tue, 21 Mar 2023 09:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B084FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so9036265wmq.1
        for <soc@kernel.org>; Tue, 21 Mar 2023 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679390963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1uHph1RCcCMxEyyxylwFED3FpSIUdpvkqwOHRakgeag=;
        b=oXXBPv3kh7GIgeLcExIahE9APHsSHas/UaQrRt9AMuuzuHVakzREsIZQV7qDXuzkwj
         Aut2qvbeW7R6v+BcvX154IEXeCKhnn4h03KF7HJZHiBCJhH3A70Nq62Q1OI9nbQ1veDm
         FQEg6mKS1/Y0K7Yt13u0V7uI5g6HM+kEOWk5Be1vbpTR+YYK33QRHTac/BcPI83/QIPF
         I0atFE5bd9r/l0+WptE0Ofj4xBHBJYsysVQbfVhBJAq//cr0tvoe4HGMUpVxbTbOlNSp
         j/WE2xXV9IkI6yasEvNWbCN/eiyhfBQ0hhECwWtpx/EcjekkgimvwdvK/sRtdvrW5k9K
         kQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679390963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uHph1RCcCMxEyyxylwFED3FpSIUdpvkqwOHRakgeag=;
        b=I9w+repG5X4Vat9YKkC9Ah157TC5dYSoxQeEB6AgQq3XFZlfa9a9TQ/xU19POFEuj+
         ix3zgPey+LtAVeJuOf09wztIhkXOli+E0unS/JpfeW3yFjuxQ9HaD4Me9BLOYizO+Ntw
         8xucOBZ9Xed9AcPfdnHiQiiG+j5T8TXxvIEDVQdqJx4LWh/0kCKkXl/jhZ+Vwyoj8Uiv
         5yUBxRDuL06mhqaWDdscGTMdqmKd/649sr25DJII068ERs2hsRjnQD6SSOImQfIpR1k/
         +9ocWQNKe7LHwTo4PhgYj+0PWlOKGHCHTz1N0L5tKRIvu2VAyEDpJ0V5HYmnfCHItZHT
         5uMw==
X-Gm-Message-State: AO0yUKW9l3O5EEktMI8P1jyEguOElSHkXXLcnr4a88NPrKaOxKp4bzje
	qo3ACkQ/cAFHPWgGBfGJcpw=
X-Google-Smtp-Source: AK7set8m8l1KBcrGaQeUuJdX8jUhoE7/xDwDdbfGpIbkxyiTXnYDnff4hqAzIRzWngx85WIaySIVsQ==
X-Received: by 2002:a7b:cbc2:0:b0:3e1:374:8b66 with SMTP id n2-20020a7bcbc2000000b003e103748b66mr1609067wmi.40.1679390962873;
        Tue, 21 Mar 2023 02:29:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c028400b003eb192787bfsm12930779wmk.25.2023.03.21.02.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 02:29:22 -0700 (PDT)
Date: Tue, 21 Mar 2023 12:29:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>
List-Id: <soc.lore.kernel.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: mstar: remove unused config MACH_MERCURY
Message-ID: <b8cdf7dc-9bd9-410b-a637-c63e1becc056@kili.mountain>
References: <20230321033810.22017-1-lukas.bulwahn@gmail.com>
 <CAFr9PXmKsequA3V7QWC2fKQYZgaNRj+q3q=UOBLmg6wxYKiVYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXmKsequA3V7QWC2fKQYZgaNRj+q3q=UOBLmg6wxYKiVYg@mail.gmail.com>

On Tue, Mar 21, 2023 at 05:33:19PM +0900, Daniel Palmer wrote:
> Hi Lukas
> 
> On Tue, 21 Mar 2023 at 12:38, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 312b62b6610c ("ARM: mstar: Add machine for MStar/Sigmastar Armv7
> > SoCs") adds the config MACH_INFINITY and MACH_MERCURY. The MACH_INFINITY
> > config is used in the gpio-msc313 driver, but the MACH_MERCURY config is
> > never used to configure anything in the kernel tree.
> >
> > Remove the unused config MACH_MERCURY.
> 
> Because work is still on going to push that stuff.

Is there a link to the patchset?

> 
> nak from me.

This stuff hasn't been used for years.  We generally don't push dummy
code.  It's super easy to add it back when the time comes.

regards,
dan carpenter

