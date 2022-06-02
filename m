Return-Path: <SRS0=h28t=WJ=quickexpressuae.com=smtpfox-gqj4f@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FD9C433EF
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 04:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DAD78C341C0; Thu,  2 Jun 2022 04:39:47 +0000 (UTC)
Received: from vmi706491.contaboserver.net (vmi706491.contaboserver.net [185.216.75.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4536C385A5
	for <soc@kernel.org>; Thu,  2 Jun 2022 04:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4536C385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=quickexpressuae.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=quickexpressuae.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=quickexpressuae.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9T3K4Kxzm/8RidIFUF+QiGduxvlk5tdRAryWdfJB2Og=; b=ZC4KssOVSOVzwczTNeVus5r92x
	WAi4ZSKkQ4qcYCKTdRn3Q2RzbbTb4sEr1XVow7QlvSrZ8LtmhezSvOKx62aLYKXwZkL+wkMqmCZkx
	k7kOW+PapqCYj0DmazQkt8GTPdTtfvRgOP3pkuf1MJgkfmqDU2uM8CH9NuQsHRcXwE5sGdJZ7vXrO
	LQZ8CBdR5XXUFiNvg1Vfi7MIG9IWkptaVPWU5OVH1W3+qonsl2OSBAlx/FiNObulvNaSMqouMXkvD
	d1122baYs5uxncERubqosSJYILdb3xE1tDNzG/xwynowjiaPEhOBbwntIJL0dtKh9tSh00b3NeHZt
	FpGY9jKw==;
Received: from ec2-44-201-88-185.compute-1.amazonaws.com ([44.201.88.185]:56233 helo=quickexpressuae.com)
	by my.digisignhost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <smtpfox-gqj4f@quickexpressuae.com>)
	id 1nwcbz-0006wH-Qq
	for soc@kernel.org;
	Thu, 02 Jun 2022 08:39:05 +0400
Reply-To: Mrs Karen Ngui <k4ngu12@gmail.com>
From: Karen Ngui <smtpfox-gqj4f@quickexpressuae.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: Hello
Date: 2 Jun 2022 04:39:05 +0000
Message-ID: <20220602043904.27FED6AF4B4D9825@quickexpressuae.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - my.digisignhost.com
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - quickexpressuae.com
X-Get-Message-Sender-Via: my.digisignhost.com: authenticated_id: smtpfox-gqj4f@quickexpressuae.com
X-Authenticated-Sender: my.digisignhost.com: smtpfox-gqj4f@quickexpressuae.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

hello soc@kernel.org ... I am writing to check if you got my=20
previous message sent to you via LinkedIn on monday last week.
