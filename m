Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0E9C47082
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:10:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 195BE61246
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 195BE61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgaY6JNn6Usmur0e6PLSM6/OGQjZD0IhnsXeccit5bY=; b=UXHhmwFBdDmf40
	Olmr2/ce2B1qYDg8pT5deyVsfLz7J+WPcsX0+ZOXTGeOewoAvCzBZ9lrwuT2wKELbHmZKicTZ3Jo3
	w1jo94SG42F1sN/gA1SljkZMYDxKX4ZxIaR0s3oVxk8+kKGcC2Fv2vBm+jewwdZTfoOOezdqgF0Rm
	8Y1YMuDc9pA1XBH2xT4rEg1WxITht8WVnSD/eDHwjqdVHAweIWnU7+Z1KFVXcRd+5Y/AXGhhFsj0Y
	rpAXX361LLoLcIzyh4T7gSURmYTeetDzIz96J1dRLfRdFS0TZ3RNpofeSQvgmylR0OYJyPCYNc4iA
	B0z5I14es4/LUSikP0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqYez-007c36-Ra; Tue, 08 Jun 2021 10:08:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqYew-007c24-8l; Tue, 08 Jun 2021 10:08:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12B29610C7;
 Tue,  8 Jun 2021 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623146914;
 bh=wm2y0Largooha4aKi3qfuvMeG0kXbGFyM6u5UVrfvko=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=j6+4OuLfdPXugeX2hkdbW7i12e6sxtYNH1BrFdjIWqEWZzZD/CUK8s9X7r3X4hBwE
 x6AkltdrWBKNe/DCYzDV4FBwbUC/A3gKrA7JG+QwQs5YUNAxOUtPztQKKGLNqxsej0
 ehVMVG3IX5ltEcQQmbADsy8xy4S4Nzlg6MTMYOMYtaQq7Nw/HIqxN+sNYQFr57vwlL
 67tegIv/i8P3kULUSitxV7TTAIws0Ti0iT/FlQESGcrX8QQOGjThqufqk2CTbzd+hh
 tk1RM6dxxYd3Y1LzbNjxvsKjXm/3HQolLxUrOlUS/to165+ovwPCHP8S4ppsyfRH13
 en7TCsU5eu2AA==
Message-ID: <1059ec30752449462215cc235bbbc3141b71a936.camel@kernel.org>
Subject: Re: [PATCH V2 5/7] ARM: dts: bcm283x: Fix up GPIO LED node names
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
Date: Tue, 08 Jun 2021 12:08:29 +0200
In-Reply-To: <1622981777-5023-6-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
 <1622981777-5023-6-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_030834_365633_57875864 
X-CRM114-Status: UNSURE (   6.28  )
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
Message-ID: <20210608100829.QuCEcDgsTZ_MgL_HXtVAAf_B954MQtlXlW9ZMSom4fs@z>

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> Fix the node names for the GPIO LEDs to conform to the standard node
> name led-..
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied for next.

Regards,
Nicolas


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
