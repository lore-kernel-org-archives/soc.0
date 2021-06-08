Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2ADAC47082
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:09:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7097E611BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7097E611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkLYtZJZw5UG8+kopip/Qzy84H8JgAZyIGKb2oEXCX4=; b=HmgrbnW8UjLFQn
	ZvMCvx30yTHcogHAd4QjDsC6EFMk4chEDk1KdBOGi0tDnf40Bp8Uq9VUfFlRzIXBskesEZvd7bVj/
	vlJBQWdQ+8rJVZHJRMhK5lXU3gcyHPBS6Vsb6X3pjRrTf9WThnXPhbdjznyUOGImu80ScG2B8nyvY
	jxx2YvXhShHMfWH0bMV+S0mSE8XrNqp37lYx8gBDaLNOp1JPDnme7oRCCXSn3ledW13l/IMlMJe+b
	3iwSfISzATWnBHDecj69pHY5xPLggQolqQS/+E1l+dEcYaD7bnXPVR0yf7Z0sBD7tct301dmmEcN0
	Xc6d6MbiGOIhy8gtllsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqYdr-007bg2-O9; Tue, 08 Jun 2021 10:07:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqYdo-007bf6-3n; Tue, 08 Jun 2021 10:07:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAC42611BD;
 Tue,  8 Jun 2021 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623146843;
 bh=HWnJfiXMaoXffa4RbvZdEWRa3ODRe8Aq5SWBD1rAQ1I=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=gYQlb1wblrQBg3HRS0ZCAnLx2aTysDd/Aao6cGQ+TszJz0Xhfsq1JyvPZvTqajvTC
 XybD13og5j/ooA9kUmrW8AUvxHgiZsNM/sEIvX8pN4TnODmAJCEAgLlTo4f9NiVaLn
 E9/hSpnGQIflxtiI/iAfHQM0pdclRlAsLjLYVn8YoedsaJpYXnAJz1r8JxFis1Wltt
 p5FZIjen+Dlvu9VJXBAkGulwpp1hx3Sx8rIzAdg9ajnDxSsEBzL/8z42XgP4F12CE6
 yFDU13PrPOCsnW0qz6tu9Gp/cqEsHnEx9zlzu+ZwPJhvTm05zsYImyPjMcvq7rsshp
 UHnz0uvY/asOg==
Message-ID: <8547a99f6a12ec4e476c19e8485fb68bafb237e1.camel@kernel.org>
Subject: Re: [PATCH V2 1/7] ARM: dts: bcm283x: Fix up MMC node names
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
Date: Tue, 08 Jun 2021 12:07:18 +0200
In-Reply-To: <1622981777-5023-2-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
 <1622981777-5023-2-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_030724_202210_0FF6CF7E 
X-CRM114-Status: UNSURE (   6.27  )
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
Message-ID: <20210608100718.cXzJY6q_MaNAhgMQ8BqyhNItOMpsEEDmIc4lbDU6OAg@z>

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> Fix the node names for the MMC/SD card controller to conform
> to the standard node name mmc@..
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> ---

Applied for next.

Regards,
Nicolas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
