Return-Path: <SRS0=y6Nc=JA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E074FC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Apr 2021 20:58:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7379B61357
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Apr 2021 20:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7379B61357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6uEHyOcEa/ECLrrW7MQQAlrc/QRSbizwhpcvxVQ8Bbw=; b=Jjrm3imtj7IPpHaLG/UN3mQJC
	emvxjhhvUbJTo8gIxa4xNihMdwHbhnmbU8xGVaHjt7d/8sog9J13sgc6k+y7+mml7Gre72d6u0sPf
	7XtpPg0fzrUCmQ3VMjROrMYbApTorYwFhE2XnMrzquANRD4QIDSVCAUJOiMYKT2+OSSJFq7lTqrmZ
	iSBszAJieTxClzBO1LWJDDctcMZRApJba8TtkQrMwGSqz6Y0GIyCN/QthI/YM71IQx8rQ1Dmw8R0P
	CzcCqGMi4+aRSpH9ms8S8N0IQvOucqyWqt/BWkJJcZmGe2BvnLqh0KHYpIZW4EFWG+uMvk3FgJBYa
	NOU6AcY1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSnKU-00F49k-Is; Sat, 03 Apr 2021 20:57:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSnKQ-00F48z-GZ
 for linux-arm-kernel@lists.infradead.org; Sat, 03 Apr 2021 20:57:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A442A61247;
 Sat,  3 Apr 2021 20:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617483427;
 bh=KBMgWGGAd1vr2YjSeLapUko7SpOAJTIZz3qSsywmxlQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ff9+09Y+4sJIkwphg3y66hyRm+b6COLbERnz/UhHibhnvVg8IaYWB1175D24BqYKW
 A3seAHZ3vU0CAbzOXQa2CRSbyjzSHOUc9/WRh53G4Rcof2BrlHZW8f3Tu06lBKkILD
 XvmkqokhJ/bV9HvmGspQUjpCC32YAKrUi4aQWqmdTFilC0EqK5Cv1cs2st+fVP29ob
 Fvx6DzAix+P5AWeL/tvr+FfasaRUFqMvTXamVZHUNmw/TRmv5lSmGriJnvrsmnGVNP
 Az/CXoYk19URCH38y9G7WVsv3bdFyZHVOH88chENSdjuBXLJMRzKo1Gi5tsDeXssDL
 ISiCXp0UnGRrQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Olof Johansson <olof@lixom.net>, arm@kernel.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v5.12 (#1)
Date: Sat,  3 Apr 2021 22:56:56 +0200
Message-ID: <161748341017.896324.9953024889088248771.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <87a6qgctit.fsf@BL-laptop>
References: <87a6qgctit.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210403_215710_755319_E1F9C0A8 
X-CRM114-Status: UNSURE (   7.07  )
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
Message-ID: <20210403205656.uHTAVtC8jOjtd2BGxXuHmHJMMMKF2WNMJfQoAEnpbpg@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 02 Apr 2021 22:37:30 +0200, Gregory CLEMENT wrote:
> Here is the first pull request for fixes for mvebu for v5.12.
> 
> Gregory
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 6bf18bbe1999c4ad4875bb7205df70e1037d17cd

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
