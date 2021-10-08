Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E70C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:13:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD51561019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD51561019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jXQL/7Qz1+AC/AKDu7EQilKYgu7IV+KTTEuDZA8uoEo=; b=pLWj+D22LY3Ber
	K571JZISMAz3pXGnxecOoBVS5UKNEvn/ptX7sPvzoUHoevb78Vqr5v9JSRRSDrKPyJwMHIBZysT7S
	lQBzp+T1/5xXxR14GBgwy3RqSnbSdWDnZkaiV2fZzwRPFUNZfy689CmUlLS0AFegQLTOqGmwbCmjV
	K8R0uCNz1HljcI3C1UsqdzUrAKfLe4deY3Z+mo937WdqAZ4OYjBVteb01ojmR0MjF+XPV4/4aTCm7
	M8m2i4Xda8Cb6/UN3VCN91RWK8P+rMVx782b99wS1PVo1l+EQ1E2YKpzT71rJx6bqh2y+ffqvt2Kv
	jR3pPcgdCYrvZrbpe7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwDU-0042hd-8Z; Fri, 08 Oct 2021 20:11:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwDQ-0042gn-J0
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 20:11:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id o20so32978177wro.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 13:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qLFCopQKc/vCOx+24oqmh4K8/QaELpGj1J/iZZrBdiU=;
 b=VWTBdZeXIfwaJM+X2owISYfzG64lPdTepaEgnRDgMR93R4gfIWiFXIgIY43mlbPHQ7
 SolmlIsZzjJJm+h5ZDeWYARZ2rbSzsezoOPu6OXy++Q3B0obVwY7mfTvkk+2h7nRKMuI
 /60S7cKILdfuaCN9tg2GYfXTMZ0ADAT+VixN8fZgLR3I5HDnJ7redcA/IQB1WOC+IXJs
 HQ6NRKOiRkaDNgzzAWk2SgJFTzo88n5RUifTaTEQQBGPLmWT2hmMewGh2l/4ra4+d85j
 K3dkDJ6EQz9xHZf9bpklhpACGCL3aIWeWP5Wf3JG40bo3wXy7iaVE3DBJN4WDwNICq0h
 408w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qLFCopQKc/vCOx+24oqmh4K8/QaELpGj1J/iZZrBdiU=;
 b=mG7igZgbzTCP3q8HROF+U/CTUzFFKChb53TNd4emgEAHDv2iQ0vicbbsD4wczyqs8d
 WlgyS5L6SyfaebspmRknENmHhg6mroylAOLkL7nQXsFuwWxOVm8psnduFjORlU+VvWs3
 zcLkKfyvxfrkRzy8CGjQmXxk3rZSsnH8p0boA3A2/OaHgPxJ0ARZub0EfKm4x1shYaCD
 ThS2XB6KRFj+SCVUzqCGxoRLF5ppiYYb1S1tBMFQW01Wy/He3xiBHKf5BWUaV+RlUedt
 98pk6EPFsq0i3CwVcWWewEdJDGG2AzsD41ZZENdFj1DPLjbf023C1XsdFQS1BDLWt4St
 xJwA==
X-Gm-Message-State: AOAM533TBounOqH8emw+3HyJ2GXlL1xi3nKftoDxjGjgYIid97sUzcfM
 VUm/PjDqhqTC8d5J0ljmTTM=
X-Google-Smtp-Source: ABdhPJzLOc3FiX7dmOXgt/JXpVgkQmOXYZ/fKRhgqMZZTkGvCQ8IBUvJF21hDW4S6o/5g3uW/x10lg==
X-Received: by 2002:a1c:2:: with SMTP id 2mr5692258wma.87.1633723894408;
 Fri, 08 Oct 2021 13:11:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id z17sm150277wml.24.2021.10.08.13.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:11:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 0/7] NVIDIA Tegra changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:25 +0200
Message-ID: <20211008201132.1678814-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_131136_648316_0D8B1E9F 
X-CRM114-Status: UNSURE (   8.49  )
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
Message-ID: <20211008201125.d7GvkC65vwZMFOEfdLuBkZrxBA7EyjaUpbQgdpJ9Uyw@z>

Hi ARM SoC maintainers,

here's the set of Tegra pull requests for v5.16-rc1. I'm sending them
out a week earlier than usual because I'm out of the office next week
and want to make sure they don't miss the v5.15-rc6 deadline.

These patches have all gone through at least one iteration of linux-next
and I haven't heard of any issues so far. If anything should come up
nevertheless, I'll be back online shortly after v5.15-rc6 and can help
fix things up. If anything urgent happens before that, Jon should be
able to fill in for me.

Thanks,
Thierry

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
