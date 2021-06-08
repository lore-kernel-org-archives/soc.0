Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B9EC4743E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:10:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 000CE61246
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 000CE61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQ8qJiI+UIv14pNZC9x27JufuCXvGEMdZ514qKe1edM=; b=fqWjjLZDWUOAja
	WBvPShmrAA6SeV9TOeF6x2hgcDpzt5GMR7NqOguQYljbOfDTLdrIoUMiS0Wcd4gHh4aCaKXDP5sc4
	wpsHyeApPIxW/gcapx//V2imgmdZ7OcxTpf3dolWGKBDxPXl4XMbiVKWMU0R1qt9ImZqdsEjdT2YQ
	dwxQdxjaOhBE9HflxJZJUPSytPFZ6RcKhA2vgDJYmkRfoETDe4PekqqfNGwOoCtEvwqsscYUJAxAF
	g4Nq46DzDdtw0cmrtNjqnyhOUURIAS0ILH4OF+lGIrYKXa8zm1sJaQUN7fnDyC+oTEyDBQF6IuJhD
	p+gCVIVsQYevN8qn1WSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqYeh-007bx3-IR; Tue, 08 Jun 2021 10:08:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqYed-007bvt-QF; Tue, 08 Jun 2021 10:08:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B68361246;
 Tue,  8 Jun 2021 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623146895;
 bh=DDCm8RVclriD3DXxISVlmK/eFSsArOhKQvHVfKr5azk=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=NinrUWYtBwUgv/EiWPsmXVw2glIYAw7ZZF8OMPhafEeHbHE+RMgE0rwXBueurvfKT
 KBHSo7jfOhIAdJG1NmrbCeWDIK4iM2iFjCLrc9FQ+vmJ4o93hf2p3+m+2wyPAtTcxM
 fJQUrfF1X2aWawl2l+Ffg/QbIRDQr7j/prFQma8sUXtSHvSoL033LY0kWW5+zfH04E
 dsYAwZA6ZDBdbkU731Ta13qNHNqQOew+MHq2slXIVH1ytJ1DJje6ixZXxBHmxvhMUr
 fK/JoleZ3sWHFBc3xCNwmOKhiSiA/nbPxXAFq1pi3yaoaF3T++0ktBKcmycB8jIJ0R
 OhgD6sBI1QhuQ==
Message-ID: <b047ebd63411bb66bb80d2593957d4614001fd0d.camel@kernel.org>
Subject: Re: [PATCH V2 3/7] ARM: dts: Move BCM2711 RPi specific into
 separate dtsi
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,  Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Date: Tue, 08 Jun 2021 12:08:10 +0200
In-Reply-To: <1622981777-5023-4-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
 <1622981777-5023-4-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_030815_910183_2424134F 
X-CRM114-Status: UNSURE (   8.08  )
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
Message-ID: <20210608100810.4l9vj4cPI9AAce5KAKaGayPSxLhxAX-eVcVJhezMStc@z>

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> There is a lot of Raspberry Pi specific stuff (neither SoC or board
> specific) for the BCM2711 which is currently in the RPi 4 B dts. In order
> to avoid copy & paste for every new BCM2711 based Raspberry Pi, move it
> into a separate dtsi.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied for next.

Regards,
Nicolas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
