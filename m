Return-Path: <SRS0=CMbw=J3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443C9C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Apr 2021 18:00:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE9E61469
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Apr 2021 18:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE9E61469
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VqRy8vZWgspYTgdhwYboZKe+9QqBN/DcT5ZKJGEiViw=; b=Q1qRxWt4FhwowaqQ+gP4DwBsi
	jOHZt4s18FUDzHXjnOjvylGgFQv1edwnVu7AV5bnH0+qo72kkELa86++teD8P+o0PBEncRVvnjpIa
	52ANuuDrHkujtocurMLv8kmuY9AjbVeHE6ewzkchGujvEpcd+Dg43uziFwcD3gPRCocSBrihaHZ6w
	HyTbv1oM9q1oKUUDJOV9LOYbG/M0B43ItdEpgIRegFw/atS9ilVR+DLje/TSA7e0Cq/0dj1xPdLWX
	yeMNn5HfoN61lXz+vxUBJk/UB+UA9X31mxb4qZ8yh0mN3d6le0VNtMlPVUYEA2u9QaSw4xZh8/e6A
	jG3/YjHrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcXPC-008KeR-7k; Fri, 30 Apr 2021 17:58:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcXP9-008Ke4-Ni
 for linux-arm-kernel@desiato.infradead.org; Fri, 30 Apr 2021 17:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 List-Id:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=FlHWI4Nfd5bO4Ik5Divs8aJaIUiZg9zykTmI2yJy+v8=; b=S8fByMXf+fxYmxlomjudO9YHL+
 lqrEhbNhCb3+lxEJEIjEWwPZKX+ITSPDSbjs86yB1fiTDhwb6a2ejO26Pl0Crq6aUA+JzuvSugqL9
 FpLMR6PXz/M5iTVChwIIRKp1of36cOGyOKwmAM4ppA0isUZzZjtJJTXXdzvOTzwTzcnluzEt48T/k
 8170C0VAgNeXx/00St+l/AjFPPu4e+u+60aabOYq4kg2J7YvUGKo5Ypz3CCpIOTC43ZpFQReUCICF
 PV4Ltv2vJTScvQuQ2w6K3mnbWAfkQ4id/8/lqlBdNKhrUb4aKmGkvinXhmWemuz2PiAAlJ0ViAO4b
 puWrQFxQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcXP7-001ZZI-3G
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Apr 2021 17:58:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D029161449;
 Fri, 30 Apr 2021 17:58:14 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Li <yang.lee@linux.alibaba.com>,
	lorenzo.pieralisi@arm.com
List-Id: <soc.lore.kernel.org>
Cc: Will Deacon <will@kernel.org>, soc@kernel.org, sudeep.holla@arm.com,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v2] psci: Remove unneeded semicolon
Date: Fri, 30 Apr 2021 18:58:06 +0100
Message-ID: <161980533328.3085.13894440622093726768.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1619659589-4775-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1619659589-4775-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_105817_205406_4E041D84 
X-CRM114-Status: UNSURE (   5.26  )
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
Message-ID: <20210430175806.f6szBj4I8P0qlwSp0o678fAp5bKg2__U3duwXBK8Yp8@z>

On Thu, 29 Apr 2021 09:26:29 +0800, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/firmware/psci/psci.c:141:2-3: Unneeded semicolon

Applied to arm64 (for-next/core), thanks!

[1/1] psci: Remove unneeded semicolon
      https://git.kernel.org/arm64/c/9b924f4f0d8f

-- 
Catalin


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
