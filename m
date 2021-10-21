Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C56C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 20:50:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BC7860EBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 20:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BC7860EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrNmswjyinSUU2dE1dAn2ZlpsDYZ/k0nDVawMfHZ0rA=; b=LDiDhvKL2lshMf
	idqo88zryLWGT4puO6o/ryqq4z90ngpwGfaQBEhBlkBLXfy+sp5M4qB2zj+T4LHJzU2xGQQP3Fax6
	Fgdwjd7K5DFDkqvua0aDLPnsKFagOrdJn5+aFN5V6FIgwP301/JSPt8m3ajbDV86GYVyDYp1/Ey4E
	/FIoyBdBqrvf3vTKaKJm9tstwvupmK8ezMjGY2xaxNE1/Bm8GYSNWKa9hD3z9rIBoHtdgurV5JvQs
	IkTb/hFXD71Dnnvds0goqPqnXkpUJzZKSUXVL0IGGkTkBvLIfGn+tCmlz8uvwEfvJg0XNWdjHdoso
	3qlIIOCtOEZfucCjY+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdf05-0096Np-Bt; Thu, 21 Oct 2021 20:49:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdf00-0096NG-Oi
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 20:49:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B411060EBB
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634849355;
 bh=N1XtE1OWTzAkiDLfZ5riecAxAc2dJiyFhKFD5km9U44=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=W6W1JGr9CKmc/VsaJ5+MRegEIym0kmy/BMbP2C2anBEoUDHps2poFFwuo9TDmwnDp
 BkHbmAWo5Jaemhx/+wC9aAwybHvSUulzsBhkoTdTmsC8H4GBoLcuIfVtZXXS74Z933
 eRYlubdcC/lvWyz3qETkeeQwI108MMv/2L/Ls0FOm+t34acN4QGjR4MbTVVSk6L2Ww
 Glh+xrFWFD9KvtKht3k5sKI9RUF4Jf485SDBzOqeM1xr7l+VfoJ3YTMsP3nax/RDYw
 YQEIM8PQZ3c+YyDbcm1idlweChNRxXDDP6PM34Q8Q/RDh9erLNMEjYqGJrBE9eOW+C
 GV1ZwJX9HB60g==
Received: by mail-wr1-f43.google.com with SMTP id u18so1433059wrg.5
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 13:49:15 -0700 (PDT)
X-Gm-Message-State: AOAM531fi9FQ6MWlMmeZI0w/ZpkG52XmxxFKch0byWFejyxzmYzjjE+e
 Q86cG8/KFY0IwWF3IWDaXMLILVImnGCy9IgVuvk=
X-Google-Smtp-Source: ABdhPJydKQnjX3tVgmWZdJEBfbkBOJb7dZ7LTOsWZl7H60FIGvqJ6n1/DCJzrPzTS605K2H4ucdW8qU9g7PKsxl5PsY=
X-Received: by 2002:adf:d0c6:: with SMTP id z6mr8580964wrh.336.1634849354229; 
 Thu, 21 Oct 2021 13:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211013143810.2101838-1-arnd@kernel.org>
 <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+WqboHoqHN-c5KAWPzMZm3dgExWr8RT7+-5bzwSA5BUQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Oct 2021 22:48:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
Message-ID: <CAK8P3a1SreOdJ=jMvRYhwyWhTdEOBMzW+AFX2bRztRStrDWVLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: remove leading 0 on unit address
To: Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, SoC Team <soc@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_134916_848553_788877F4 
X-CRM114-Status: GOOD (  13.06  )
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
Message-ID: <20211021204858.KDRVugUmbYkaCNKPS7DrBqkGO5GZQxIlgrDjqyU7jig@z>

On Thu, Oct 14, 2021 at 2:53 AM Rob Herring <robh+dt@kernel.org> wrote:
> On Wed, Oct 13, 2021 at 9:38 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> Please apply these instead:
> https://lore.kernel.org/all/20210913192816.1225025-7-robh@kernel.org/
> https://lore.kernel.org/all/20210913192816.1225025-8-robh@kernel.org/
>
> There's also also these fixes that I sent:
> https://lore.kernel.org/all/20210928192143.1841497-1-robh@kernel.org/
> https://lore.kernel.org/all/20210928192210.1842377-1-robh@kernel.org/
> https://lore.kernel.org/all/20210928192123.1840842-1-robh@kernel.org/
> https://lore.kernel.org/all/20210928191759.1835325-1-robh@kernel.org/

Is this list still up to date? It looks like some of these are already
in linux-next
by now, so I'm not sure which ones to apply. Could you send the ones that
you want me to take to soc@kernel.org?

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
