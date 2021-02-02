Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5BCC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:38:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924BD64F61
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 21:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924BD64F61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p6xR8PvCpIabbDdXffse6Qx2sLxt3q3AYq9b5aA+mTI=; b=DfCQUa9BOrjrrlAKs0RKqyCXQ
	dTQtsa8yGLJJBNrhZgPkGJgsveBH3w4DHP2GkuHwxnQ3LDHeVNc1657iYaWs+MKrV0ijTpoUXKSZ9
	+DAZ5joJHYLyZKmWloYyDC0dBau48ywF56H9G+DQ080gcxhaXPC0EONkRPALh9zMQBHubLuf2V7e9
	9TCtpbavhUowMW8+6Bnr7ADpFcW/uusjwo2FMOovYy9tu2M/GeWoh4WQtnSyLigzHklUl0JJYLaYS
	6QCGBAuNusv9b1M4wH0khjHiNcUSjjPaOThnCUgvD8/vZ9YVRnliqpkjxehuRBfFdWKhiplQfE7CH
	h2QdnpqKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l73M2-0003UB-Rb; Tue, 02 Feb 2021 21:36:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l73Lz-0003Tl-Tw
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 21:36:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D19464F61;
 Tue,  2 Feb 2021 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612301815;
 bh=l2zLiFQYnlqIzy1qNedzusDW5xujvBFhDqicPTJu+K4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i7xRh+5e1Icq8XUlZO6RPmgx78gebZqS2ntA/0MKpOiIMHLutKd3a0Ezp8vPx2aoy
 QnMnhD/ux5KG8spsvjJ9+YU2qPHmjlTKTfstzXX5/iUgjgBxL1UcVdj2iRaQfer6qD
 bUdwt0GoNLUJtaiRHwDvKFQ7i/qxBb6mWr1cvOPP9nicjIFWYSNrKvn5RAD9W1b21y
 vttN/OJXVr6+S8Qq3dPoV0GhmD1ml1psdrWV/H49Pfbgh/gM7M/FIfWR7JOMGRLCOO
 BulN+nhmB9rdVvkecUxq/zzZs7ck7Z/YKOJU+VvJ26DGYbSWYZnA+Z4Zk8UzHIQD9u
 NnYGhDQzuZplA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [GIT PULL 5/6] Broadcom drivers changes for 5.12
Date: Tue,  2 Feb 2021 22:36:47 +0100
Message-ID: <161230178545.1902917.1837726983239956032.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-5-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
 <20210131221721.685974-5-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_163656_126699_11E06D5E 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, khilman@kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202213647.hiF-JLO0KNYgCDCWhcO7uZRL9kKrisi45ATD2tFI4y4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:19 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/drivers
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 60a64da9f0d0b7e766ba9bb0c11e28ca780fc2fd

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
