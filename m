Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26354C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:26:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A22E9610CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A22E9610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gVHWEEAnOr3xHXMA7imd0QfY5wUIMLIUqHy5cNGgTDk=; b=jIOSYZZXt5x7ptjAySUuioTeb
	r3Xo3/biKK8373ofCcLW9jWqMa3w7QeZL0ZEIWSS5Ic1/fmsNYpqOB81ncKCyVH9hx2KzJxDiY3oi
	Wp83NJ8iBS0AGYeXJaMupbHxM11prP2BSb08gqyZCy8TqoEuBkDTYJsGz3V15IBv9ktFfz1c2hszN
	HS2672aGLLICYOrAbP6+Bmc7VMViwvgMYf4qLAAbdihMfTkUr6dog433wPUjXtWkt745JHQd15qwQ
	e6WGa72+T4I46rSgSOS+q6r1q9311Hf6GsaCYsdn0AT7ZgPjo+ypEMW1VYiySza9yRs9KBt5b7htv
	GZNzG2Dlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRuVF-009CwU-O6; Thu, 01 Apr 2021 10:24:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRuUY-009Cjt-K3
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 10:24:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF56B610CD;
 Thu,  1 Apr 2021 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272637;
 bh=NlzFEJnGo31nu4+3b3ZxFIOj1CRAeQgNnmnScf+84ts=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nHXYk+oUUyqi5lRKIAPZLnBOfjRmV3qSm1355uldps0T+ItrxLVNyRJs09IYST3Y8
 c+a1qx2u4t6q94r9FeCS2l5qhUqIFWhFymOQWULG26PIk+wipNmVfh4yN3Bxa9DZ3f
 IJwmQk+ekDDr9gQ/ide2+3E7ylWwqPodjcGcLlLjx3fowtNi/2MAWEZKSJaWrWzSVU
 qVn9HXc/Abca875kfIEw9rKjD8u3LLgK07yLvawPDAFcOke1JEus7Nvm55JP9sT8ir
 fVU1k+nuUaesj5+C9KF/pDwGxeFB7ZCICtlbByk3zxE243oqVDAyhisB8h4vUWEznc
 VQhgQG9SZ4rng==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, arm@kernel.org
Subject: Re: [GIT PULL] More fixes for omaps for v5.12-rc cycle
Date: Thu,  1 Apr 2021 12:23:33 +0200
Message-ID: <161727243717.583633.17499890750529623246.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1616584662-702939@atomide.com>
References: <pull-1616584662-702939@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_112359_244576_F9CB9719 
X-CRM114-Status: UNSURE (   6.72  )
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
Message-ID: <20210401102333.RJy0nUzPDtZe3IYkJO86R1nwcx4IJuAravbkfwKfEkU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 24 Mar 2021 13:20:39 +0200, Tony Lindgren wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/fixes-rc4-signed
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 111a5a421fb770d0fc2e09f7d57eb2cbe51e3ade

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
