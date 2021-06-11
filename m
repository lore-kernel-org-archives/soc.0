Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983FDC48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61255613D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61255613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rYzPx7yfuF6esyJWvldlpKSO2vXY/ItE1Vltah1gUmo=; b=0VXI/jeEVeweIQ
	orNn79eOBCWtgtQz/JWxvSJBkdkJCmoYqDyzNJvpEcxoxsn0VIRbaqrlB7Ys9kEf7fEjYaMQXSk5Z
	kHzlFeubOKVl4hCjENciUgFjxYcelJL6ZARll3R1rZ0ytTt9yZNW5n8SysnrctlXYPRD9X2jE0Ulp
	lKh1L8QGZ5Vbz7+QkRnlhaPtEWYcpJ6BwRGhR3ZPXZWMvaYH1MxlW6z6FcmxXQo7yK3WlHlGVwC1+
	CYkPvWPyC+OiBqNSuOnZhAAPLWV5Od8J5C9uk+xub2L8puC2/v519jATFxw7PMv72nuWXaveWC3CC
	PqEF80TrabxqCj2MZ8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkGP-0064RX-Da; Fri, 11 Jun 2021 16:44:10 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkGK-0064Or-7D
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 16:44:05 +0000
Received: by mail-wr1-f46.google.com with SMTP id a11so6748616wrt.13
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 09:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yl+waXKY/FzeWxugRNcrGJPBmosE4XJtLVOq9NfoCdA=;
 b=HQ8jsuewe8HfyaOnNtZa8C5X/GJcV53S3VkxFu9yC8g9zTX4sEGzIyxPhFj+cPab3V
 Bc1Uy4NJVc/PK9rnWKkbAM8WwrY+v5Ka491sb1RZNjBm5xejxmK7Vl/0x7jNvQDogSDw
 HsjS1IKSBaKvR8YU3G8EJkPWZ/yNzuF4ckpDQbTl69fhWnZVpqTU1ae7022Cg0IFU/ed
 I2478B4vbcuO5l1mIB3jOqscm4O8u03IounH/FhRTjeeqhH8YYunXY8wyYPQSeCzETK9
 VCOodVoz5I7gq/43RNE1bJtFytMWu+twO9WRXgo2PpNjXP0GvLVK3Rbk/Ly942RzS2iD
 eDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yl+waXKY/FzeWxugRNcrGJPBmosE4XJtLVOq9NfoCdA=;
 b=iBI1fMsxCCTJzOpjC+p1+Tlr/y6WXCAjydXTmhzsn1ZU9ltfQux+MJh9wX+b/M7yFE
 jRtUVP+KPEF6iuAX/cb7/pUcJVWFCdUS7sDOgnPEWHgk659RT+jGGh72w79QH+G0qTgQ
 /JkVhWZ3KvwDsHTHoIhHAg4La7FJH3VvcSuMb5pHZUId0hDruvLPQQAlamabiikuAtbE
 3B1lYwkz1lp5aPflulYsZwRe5jFl66lLzEHSeq1aYBwzhXk2koB2yGTi/15sGK0pB0La
 0wHoOhzIZJmDxR4oju+mDCHupm3OElnnSD+24e4zlZzGhZWW43qq79588q6cELrQhJRx
 LnyQ==
X-Gm-Message-State: AOAM530xvfkK85iYr0rCGJ8x8UB5T+tzXpu993MTk7KcD/U3xqpxKe/h
 8pRailpUI0xAF3W08G71HGM=
X-Google-Smtp-Source: ABdhPJwpr82yBKai2lqfab3eosWyqwmbA9K9CMq+OT5UOv5auo2zvPeZCX49wZ5z9RhN8vfyvCX2MA==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr5118102wri.293.1623429782907; 
 Fri, 11 Jun 2021 09:43:02 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id r4sm8163109wre.84.2021.06.11.09.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 09:43:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:32 +0200
Message-ID: <20210611164437.3568059-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_094404_295711_5BA27984 
X-CRM114-Status: GOOD (  10.36  )
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
Message-ID: <20210611164432.mmrloiT96KRnHOD8td22R4LOpw5NsgbFJ3YbZ8IQ6sA@z>

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-dt-bindings

for you to fetch changes up to 5f459cb0d67d6df6f74eac253ea10de9e9986812:

  dt-bindings: soc: tegra-pmc: Document core power domain (2021-06-01 13:45:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.14-rc1

This contains a conversion of the Tegra clock and reset controller
device tree bindings to the new json-schema format and adds the core
power domain to the PMC device tree bindings.

----------------------------------------------------------------
Dmitry Osipenko (2):
      dt-bindings: clock: tegra: Convert to schema
      dt-bindings: soc: tegra-pmc: Document core power domain

 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml     |  35 +++++++
 .../bindings/clock/nvidia,tegra114-car.txt         |  63 -----------
 .../bindings/clock/nvidia,tegra124-car.txt         | 107 -------------------
 .../bindings/clock/nvidia,tegra124-car.yaml        | 115 +++++++++++++++++++++
 .../bindings/clock/nvidia,tegra20-car.txt          |  63 -----------
 .../bindings/clock/nvidia,tegra20-car.yaml         |  69 +++++++++++++
 .../bindings/clock/nvidia,tegra210-car.txt         |  56 ----------
 .../bindings/clock/nvidia,tegra30-car.txt          |  63 -----------
 8 files changed, 219 insertions(+), 352 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
