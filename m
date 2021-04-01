Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D10C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:18:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1EF861041
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1EF861041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gNVkklMJpBxqsq/L+EQAQ3n1hDsEf6z6HCv5flCeR6c=; b=PNoqmnUYZxvKW0E7mMAXwm6mN
	j5/+0Gplp7OJY7RkrWlmxVGU0rA1WfEzcInucWQw4giFq8iOwcW1U2yfOjpnCUCEZu5OpM4IO4pzB
	B86q5qp0cnSkSooZASjnginwhLvWifpLdqCtpzMw9i9D7XiTHdhgcxBKfM04YXiTm4LQmcRBzKMob
	btCqwiYYGjxPgihmv1dtY5x9o66d/4ORb26ENH3YYaBECJnuHOie3NT5swPLmA8TlZIcV9rAfKPab
	EUP8SzftzPI/by5p0Eero0SCKbax1pUvc4sIu1yzuIjEmZmh2sp97i4JfHw1hgkzWXJgGLBkRW9Ty
	CeX5/7s1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3jl-00AtHt-LJ; Thu, 01 Apr 2021 20:16:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jD-00Aszd-9g
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:15:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50818610F8;
 Thu,  1 Apr 2021 20:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308141;
 bh=b8MXG3GU0ybMmhptaXm842lvOADpXqKzDv1VhTUXIuI=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XIldZVLBSy7gBY2yJg7DSRki9lX59gzXASzU4dWPhtCp/qfr1V3j/SIvKDz4ThaT1
 QiXzwKKjyILmpNIqnHkJZ6X8mVwMEwaYkOI8Pp2iJxyr/4I8fYOhf79GCXJBY5Fa3+
 VT4frnNR84CRAxR0vnv/jpqqsneGRlnQ1vHOu0gK+dmpgjDm90RDQN4HMBtOjp74ca
 CALG4qLoISzNoNom9md0TCMeKFKULTcWSHlvbGcoxNrsqFYRrqpCfH+GN25fGec5a4
 HNaLCD7QB0KJg9FAL/yK3RqK93AGyjswRa0r58BZ8+s+2aCKLxxzMrGLU0pcfcD4ek
 gwRm5JwSPxf/A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com, olof@lixom.net,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [GIT PULL 1/3] Broadcom devicetree changes for 5.13
Date: Thu,  1 Apr 2021 22:15:18 +0200
Message-ID: <161730808607.655497.16848778452197527943.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330184006.1451315-1-f.fainelli@gmail.com>
References: <20210330184006.1451315-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211543_749903_A05EE299 
X-CRM114-Status: UNSURE (   6.48  )
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
Message-ID: <20210401201518.Wa7WEz4roWJbfzQntKKNaJo4LMHQi68APUI_3RRZX8o@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 11:40:04 -0700, Florian Fainelli wrote:
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.13/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 498adc8623c237d9f87f4a0582393e0d69504bae

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
