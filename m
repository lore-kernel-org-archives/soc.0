Return-Path: <SRS0=JkwK=UP=roeck-us.net=linux@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E257FC433F5
	for <soc@archiver.kernel.org>; Tue,  5 Apr 2022 15:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A010BC385A4; Tue,  5 Apr 2022 15:40:40 +0000 (UTC)
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com [192.185.49.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39FC7C385A1
	for <soc@kernel.org>; Tue,  5 Apr 2022 15:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39FC7C385A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
	by gateway23.websitewelcome.com (Postfix) with ESMTP id A9E7B5B05
	for <soc@kernel.org>; Tue,  5 Apr 2022 10:40:31 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with SMTP
	id blIFnEolvXvvJblIFnGPt4; Tue, 05 Apr 2022 10:40:31 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r3uTnp3qXaBGXyABGhqOfk4VxI8GRTJ95xAWXm7EQEQ=; b=INMSuuJZ2h64g3ry9GHgS86pC7
	Ei9WmIj4mtVpJ85FTaZEi1DzF/Tm4/GrqHVQkEP9UGgz+qnTr5sUfvb116FupqqSRiopR8D5JsTuR
	PGcl1F0aaHqeycLBZr6G0d7TErxBww3B2PCgyfx8BEC8sFOK5AVEeernVkkDRibgR2p1Vm1dd/UhX
	Cog3PO++1Y3QzruwA24jWj9GY7n76dbh9cyeMWDV5HwIn5QVPmLNO3iPcW524noaU5wg/RTikhZyb
	siCBPrBmGwjvk8T2/UgYsRKtu5s6eY611lKYpxaCqXAQp0imNu68qaHIICnyO76kHSa6dzYjG5Lc/
	D30ktD+g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57864 helo=localhost)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@roeck-us.net>)
	id 1nblIF-004GC9-0L; Tue, 05 Apr 2022 15:40:31 +0000
Date: Tue, 5 Apr 2022 08:40:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] arm: configs: imote2: Drop defconfig as board support
 dropped.
Message-ID: <20220405154029.GA1840190@roeck-us.net>
References: <20220405135252.10283-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405135252.10283-1-Jonathan.Cameron@huawei.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nblIF-004GC9-0L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57864
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes

On Tue, Apr 05, 2022 at 02:52:52PM +0100, Jonathan Cameron wrote:
> Missed the defconfig when removing the board files causing
> failures in builds using this defconfig.
> 
> Fixes: 28f74201e37c ("ARM: pxa: remove Intel Imote2 and Stargate 2 boards")
> Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter
