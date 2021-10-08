Return-Path: <SRS0=/M0+=O4=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80F6C433F5
	for <soc@archiver.kernel.org>; Fri,  8 Oct 2021 20:11:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 85BA3610E5; Fri,  8 Oct 2021 20:11:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5793A60F93;
	Fri,  8 Oct 2021 20:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5793A60F93
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id t2so33039189wrb.8;
        Fri, 08 Oct 2021 13:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
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
        b=gOUrEsmX62DBHLZm8gc0YVLojoydelXOHnDSfNnjCZsy0ewgInD1drSFIbRBiD13Iw
         L8CjxmImFKewaTWoUKj0V4Qzfl25z+bn6J5UCPzcSCHGl+PM0+x9fEx1JEl6Q31D4AKl
         ZUlsIKLUgr7qHllmohIw8fi5Z6CIAW7r/dZses5viU1EH1DCft34KiHH9iAiFpPrSkDW
         oD+GVLYNhJT5eoBaXFZQ+TDQQ5NcBv3hpDoDesd4sBvkdGXpdnbF9KvBKsIfyhuwB+K9
         CgCj4v1EcM5a5NROYtk8ym405vPfWdf4wUZLqmAhpmE+mAF4ca53yAqjo2Kpz9AtJt4V
         K7CQ==
X-Gm-Message-State: AOAM530vIFFg5Hdqv/lhfIzSqfo1sr3OXfVadkor63ujbVb3rGib6A+Y
	4aZjuWQyln+6HyeJiBNiQw/PQTS3eiE=
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
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 0/7] NVIDIA Tegra changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:25 +0200
Message-Id: <20211008201132.1678814-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
