Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A1BC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:18:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D87610CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D87610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1NJcj8pz5L+tyeAREe4bUqdVDwmhCmlO1fg8POpdbf0=; b=VGGqOBttSCF4acv7Pk1jORBtv
	K8urKL+d689hxXo65vzdgDICq7YQzvgtZHft4S1Q8yFPNXQsy6s/lSTcf+WrRUxejKUCYSB07wxa6
	v80N0DQD6hrS9Phspj9hDhH+4iPelMtpYXCA4129/338MJUjnkfI2fMw/Eh79l3b9d2xa9twDfvXZ
	1B1Z28MaBL9ezso6+MZwQ0XhQyeiFHkSpDLwvX569WDXvT8m1TllpeaPr1foiIF7IH4o65mLuO0jF
	DW2qmblAqUB3l1DdYNWeHS/NlPWgYXCZxhn2T3koC2O2Rpb96hyU2PF500V0AXSI2fjYHh/lCcC6C
	RijyL3+iQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3kO-00AtoD-Cu; Thu, 01 Apr 2021 20:16:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jF-00At0B-Ry
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:15:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F7DD610E5;
 Thu,  1 Apr 2021 20:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308144;
 bh=jRxT7GFVZ+qWDGOz2ef0sd29yoi3l/YWUWt7NB2aoXc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X7qzmQ7ju+6RvJBMQMY0YDqqlPVo4NiJwfaSua996wbqe/wHyuSwQGrMyjdvSxKA5
 gXZJFy4AyMa0VTy5+ubQvrNz7xvYCSg9VsUHCkXuR8/PigHI5PtO/Ubis9vfSiV6Pd
 0UTVKMJKhP+fDgupDJwJ0BRFDvDiOKJIO6iuOcrqQRZ2Bsi94Zdp4GDxhWMueYGSvh
 Vtj60Xl5ue0G+6CkPKAhXUC1MiRuvWS2yvZytkYDpFysXuNyGu0u6Vuc/IV+mlYOKb
 fTzgxDR52o2PDNHr5i9k4u8APuA9rsm04m7DcCgoVosSRLzc3//pYJKTlMwTsOIExH
 LXwiey41L75tw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, olof@lixom.net,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.13
Date: Thu,  1 Apr 2021 22:15:19 +0200
Message-ID: <161730808616.655497.2246714520571394134.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330184006.1451315-2-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
 <20210330184006.1451315-2-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211546_287893_1F1F57B3 
X-CRM114-Status: UNSURE (   6.38  )
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
Message-ID: <20210401201519.zVdQkAlVP7AsASjwM8tEa0ut-RHBhiT7xOpNCFZU7vo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 11:40:05 -0700, Florian Fainelli wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/devicetre-arm64
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 3b73ea6c8069a616be468d00c7ba6148bf82dad9

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
