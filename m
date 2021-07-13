Return-Path: <SRS0=79U8=MF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7443EC07E95
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jul 2021 11:17:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D98261178
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jul 2021 11:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D98261178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfWLVYVNkaoKw5WRno/6wEe+u72K5DPLimT4+7X1Hio=; b=y9Gu2DmwfciKML
	VRF8Ut1RKQmpiCYg5RH5f4hI3vk7wa2mz79ZjA7RpUXTtXohNuwPxVcqPh1OzQSug+vwLcbXLEzlR
	fBUb27gJ6ETyG1ItvjQH7YUJrVTIxldMLXVUQPUuqo7JxnlYFTr6qkLfdGbyqmux/d6CzM1P235+p
	xm37+8vEWrlL3uPlRO1o20Rl/JBwQYSo5zxOzzwLRzYgGHUjy+uQGTPq2cUfN7E8T5Z+L4SiFB5d+
	cLunQMhdMpjx9EztCpLwMCA/aobwwiwm1cFvNv/V1T3QpJzQAL4QXhqBO9PbuKkM2xUhuRuvoqE+t
	WV+pGdhrq129xpmYEeKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3GOT-00A7Rt-Bo; Tue, 13 Jul 2021 11:16:06 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3G0S-00A2DJ-Fb
 for linux-arm-kernel@lists.infradead.org; Tue, 13 Jul 2021 10:51:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77E686D;
 Tue, 13 Jul 2021 03:51:12 -0700 (PDT)
Received: from bogus (unknown [10.57.79.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E65D3F7D8;
 Tue, 13 Jul 2021 03:51:10 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:50:08 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v5.14(part 2)
Message-ID: <20210713105008.reihuql4ceeg6z46@bogus>
References: <20210625102819.206172-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210625102819.206172-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_035116_622930_72EFD135 
X-CRM114-Status: UNSURE (   6.81  )
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
Message-ID: <20210713105008.XvT3pyQTXfAIYZoz4Fw7kNFskct6njRvFitN8C_oz58@z>

On Fri, Jun 25, 2021 at 11:28:19AM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
>
> Please pull !
>

Please ignore this, will send updated fixes. I will delete the tag to
avoid confusion.

--
Regards,
Sudeep

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
