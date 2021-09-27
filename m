Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD855C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 10:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8867A6101A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 10:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8867A6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RQLe6Crvn7fRpyP8sTnBIMIpdVnhEMBTqTXuHAbC+4=; b=qvGdmYl78JXVyn
	j+b/tXBdrTwyU4WouvPzAyiE8zhzgK/0FUJikHyBq94ZHSu3ACx60ECvQ2Z/yuXYQZut2bYDlCNEl
	e0/tAoF/EyDrZuZFx7jMyw1gmm/2aqsxdeFmx1qtQTUvO6F2Ay384ip7DN9M/FRYZDOaUvis69Jzr
	jXCfmjoOd/Nre16SZw2d0EDNtIfmNJJe9wYJPzsCuhdGygdBGLdTxeCtVfxuRFexkNW6M98g3zmi0
	d0YBeTA0BdomJyBmR9ozZKDLDiugNx2yIpR/vZZE5pG9nlj+2azQWO4HDsAAmDSRj4xTPHsthxcBF
	Oh3k7/9erNCpXhxl1Tbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUo0M-002IzN-1e; Mon, 27 Sep 2021 10:37:02 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUo0I-002Iyj-Ib
 for linux-arm-kernel@lists.infradead.org; Mon, 27 Sep 2021 10:36:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B691FB;
 Mon, 27 Sep 2021 03:36:55 -0700 (PDT)
Received: from bogus (unknown [10.57.25.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C98C3F70D;
 Mon, 27 Sep 2021 03:36:52 -0700 (PDT)
Date: Mon, 27 Sep 2021 11:36:31 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
List-Id: <soc.lore.kernel.org>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
 ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] arm64/ARM: dts: juno/vexpress: Fixes for v5.15
Message-ID: <20210927103631.oqecn4n3atyxibo6@bogus>
References: <20210922175910.2682172-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210922175910.2682172-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_033658_701301_EB0706D2 
X-CRM114-Status: UNSURE (   7.89  )
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
Message-ID: <20210927103631.V3q-NLsGlClZaHN2YEV02gF-i-Ijs2ZIOq0jYTmidhw@z>

On Wed, Sep 22, 2021 at 06:59:10PM +0100, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 

Please ignore this pull request. A boot regression on some vexpress platforms
was found. We have the fix for the same and I will resend the PR along with
the fix soon.

-- 
Regards,
Sudeep

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
