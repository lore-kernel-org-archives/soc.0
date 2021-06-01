Return-Path: <SRS0=hZ7m=K3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662E9C47080
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 09:37:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A12B60C3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 09:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A12B60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaHkBSPdgbJgh1jmX1HUFr7nRBnOHJxXN/WfCmNvRpA=; b=sC3qUHWx455txu
	7Q7cWAHkwBWmBzvKey5UFSVCGVQpJ8xsRtA9VwPmnyVIVourjnMmizzzSLxasnaA0Tj8Er1EYQHQL
	06IVEhciSUDvB8ZgISf7x2fw5gFuo9FpP4+q3khewPaHEyEES8YumLIk431//LloOXySOe8nH2Qtu
	45hWO9cexXrtfSjPvUKzffjzIjk4Ankxh9rJtUytTZCuLBOHalhes0X7A8Y9sxI9ExCwZ/D/LO9DS
	IkEPfap0Wejr0eQCLuVR7KkdmhqUxZUAIoEIEMH2aygikydCQKZ315yY2xE35XQF2pr8ljQK6dovF
	tfLL0U4Xge/03s6oHrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0op-00FgEw-K3; Tue, 01 Jun 2021 09:36:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0ok-00FgDG-FN; Tue, 01 Jun 2021 09:36:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60458611CA;
 Tue,  1 Jun 2021 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622540170;
 bh=XcOwWvTd7DXF9/7voob3uiilvL0AFQVxbZTA2b3WL7E=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=J+xj/Wff05jT5pnhLd/ik9Uk+4pgbY8zgUsmzlauVgiF8sfuXqYEUS4k2mX4JyXKx
 bBo2zv8wrvTOEg7yHOnMUO1yhNR1TgbpILpGKAcno7V+qASWmHQo70NDHW7yBpiLi+
 WbiSiF4zOzSD1+q8CQjVnK/Z2xu5mAal/xjMGHodLcZyHnd+MiUSmvpmGuWYf7P90H
 gn7Qr24XoJitUlQhirxN/YMl5HzR39URnUhxQnpMJ0vl+m8t1LStrhCmEEf4EKzhJU
 aeLlezGqCKMS51tRYN7RRht5spoMoMAaScAGrrMu8CBw7+1i3wM1jTHImM80cbmVBL
 zW7qohiR0wQ4Q==
Message-ID: <6faee8b64235d92ffa308b570718ea1eb68b758b.camel@kernel.org>
Subject: Re: [PATCH 1/6] ARM: dts: bcm283x: Fix up MMC node names
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
Date: Tue, 01 Jun 2021 11:36:05 +0200
In-Reply-To: <1622366775-5309-2-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-2-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_023610_599351_6639610E 
X-CRM114-Status: UNSURE (   6.57  )
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
Message-ID: <20210601093605.rXaTmWwMd9dgNcoGyesFog1GBtoKGlaPQ3O24IgEEj8@z>

On Sun, 2021-05-30 at 11:26 +0200, Stefan Wahren wrote:
> Fix the node names for the MMC/SD card controller to conform
> to the standard node name mmc@..
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Thanks,
Nicolas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
