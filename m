Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B7CC47082
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9833261246
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 10:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9833261246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjVzpbRnYDQ1nhRG8SNnSVN1d5GLLy6ztOBdfAWCB6Y=; b=bsyX6H5AhIrPlW
	gZX2cQRJUaQL09SSJb7fEBt9/+BAJdbf+aON73ldReSmaJYtvLkZLDuIUCC1LojF3Psol3bqSDcHf
	NCgGzluHQ9P7UYYVQy8kWZrOf32lSerMNvRN4L7ckjIeAA1nxUW+oB8NzMNWNrDvbDZzFIPEY4Vbv
	r/l60FUAINqoKsNQNsCTrCKBDxfPduBp0YPfqmGrLHSWbgWifvduFcF5LZCkTVAB8873tLvaxksTn
	CSdCVPpwXcpnNDS6t8gNdthPeQ8Po/DFj42oMHkzpvU4WLT7RB6xQ9VbnBBx83p8mFtdi3j2zSb7F
	osMOFKkJMzpPmO9/nXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqYfk-007cOL-8C; Tue, 08 Jun 2021 10:09:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqYfX-007cJi-T7; Tue, 08 Jun 2021 10:09:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8F71610C7;
 Tue,  8 Jun 2021 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623146951;
 bh=bL8krRWZqQwWrNcRXEvYBsAx1JmcUcZdNphn+9i2syA=;
 h=Subject:From:To:List-Id:Cc:Date:In-Reply-To:References:From;
 b=gvqGaSGsvkE1QAeo3jW8hAwHNBfo5KSzPBYuFVAi8PKVRkrej/XlJLdIG+/pWgsnZ
 yrM5auanfsLycop10Q0Jj/4Qh7xDEBAYQiH2bBjJWdPR/PHfwDTMgMLLKG0916f8pY
 LJyoYndrIjY0zExLPTeV4FSmVntn0VgwDL4Xj2X7EwIhYi62I1kBowoqGOK8LLK5CB
 S+oohv3TzJWZaxNuDNg37FLf9zdFTVSqh78qqebPpu18kUYFs6GIXH2dbSN/VEC0Zp
 IrnBIPHf1Ci8lRP9ONl/yJbfMqwwrfk84Wa/qgJd1eedHnX6n8KMOqi5eZBZLJbL+u
 vF954asBsWONw==
Message-ID: <53511fc7f1d01341596ba27d8269dfa712aec100.camel@kernel.org>
Subject: Re: [PATCH V2 7/7] arm64: dts: broadcom: Add reference to RPi 400
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
Date: Tue, 08 Jun 2021 12:09:06 +0200
In-Reply-To: <1622981777-5023-8-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
 <1622981777-5023-8-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_030911_987935_A44154A9 
X-CRM114-Status: UNSURE (   7.24  )
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
Message-ID: <20210608100906.DvAnPFEpTi9IoJ0Rn8r65pkZ4W3Xee78oGE5udpzWq8@z>

On Sun, 2021-06-06 at 14:16 +0200, Stefan Wahren wrote:
> This adds a reference to the dts of the Raspberry Pi 400,
> so we don't need to maintain the content in arm64.
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
