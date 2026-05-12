Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18D3314AC
	for <soc@lists.linux.dev>; Tue, 12 May 2026 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588301; cv=none; b=K6ImGBG04VGVjQr0abZ7GpiCsSadXS4tKt6eO0uQnAtvaJu+XfUWoy5S/HIztq+7/QMqeQwRgrT3xZ+VGOLS4U3YbS07I3z1ZozRxYvN0IG9FS749CrU9jA7tMbJ12N73Mb0HuSZ8dgRL1o4BpGTAydptFigABySVpkMqazIefg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588301; c=relaxed/simple;
	bh=scur44SPPz2g/+2NBENIZJZwWQ0sy0kujUVUvNtVjRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksct8/dSqxMxL9LtKRG66YFjlBUpya7cNEXcs3ntvZ+W7PLVKZYp3TaYsM/rPV2lz+ksvq/MRPww6dZzlLVwrB8GsfXscXEObOmZRkGPnMW1TWgFTgdwIQLtF4jkswmAY1AcHj+1fQ+9CjQn1g+4DE6UW1yZ3wNsXcv9VJT/B08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D2+WYjYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czZqG9QZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D2+WYjYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czZqG9QZ"
Received: by smtp.kernel.org (Postfix)
	id 726B2C2BCFB; Tue, 12 May 2026 12:18:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22257C2BCB0
	for <soc@kernel.org>; Tue, 12 May 2026 12:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22257C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAo20B2518442
	for <soc@kernel.org>; Tue, 12 May 2026 12:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+6ATdAGKsKt7iZsWFgrAlJ3BrFtCxwuxUkj
	7PKHwzXw=; b=D2+WYjYHHZ7bYBZJOGHm2B9d8lCd7m3khBVBCgsRuiZFlzByDbk
	984/qgRbxlxOYuF7+5fntfHuviX2C2OQfl+Z/oB6Lu78rqyHXuEk/d52DomH0t1O
	ks8QCFxz700NzYR8owhLvZy2x87X+Z0Hw7y2xegKAPdjy0kcMGzGWZ5eqf+yxA0l
	qIianuJB61LtWIEkOj09P2G/pAlSvWrV4QFHH2avG8m3BW2dIkjAkzbcT2yZNg9Z
	AG5pBcBs7V4Hvinlt/YdM7PHgr730n7SBHbKEx7sPZwxG9QKLtaS5sfA/PoLsjkF
	f2jIkuko6cqJImkZBREBA8BiSxQNId3dJ+A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1k8bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@kernel.org>; Tue, 12 May 2026 12:18:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e136aff17so93780711cf.3
        for <soc@kernel.org>; Tue, 12 May 2026 05:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588297; x=1779193097; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+6ATdAGKsKt7iZsWFgrAlJ3BrFtCxwuxUkj7PKHwzXw=;
        b=czZqG9QZSqVjPrOkz3rNnhhwfsUMVsBcRcXGTeqfoLhB7/jjR7Ej/xPk/occofv4WA
         BvNKnU9c6aFa5Zd0daBYHAAQGB4XlltjWMTTxqg44nmOZbVBFmZ6O1B0h1MhrBI79J23
         /lPe/MSfbrXYf10dHdfEH2mlshiy7qyxU7AhOiv52JxkO6aiFOrl9Fpx5x+zm7dpgfHn
         GExPgfXKaNSKfaLH32bOXVLk1jBkcL66Idpt2E1SumobJgmi502mcEEHmh+i6xiP94Ij
         i7jO3BuoLOwqGi7pjNxQdDpa98OvGlpc1phvGQnJ1UZkNCRla7L8VO4Wxaa8TZb+EuHF
         MMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588297; x=1779193097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6ATdAGKsKt7iZsWFgrAlJ3BrFtCxwuxUkj7PKHwzXw=;
        b=K8VI70ZFCKYNMLQBwK8jbP3ggsOVx4jTawPja0ItWA98TwLWzZdrPsQ4ir3G1XsfL6
         jHqQCinr2z7HjjTYhlvXbz7D35uMYhXaeMsVg4sOoIUNGgfnbMfGmuNQbq5W4daRyHna
         b8lp3JuQo3tfna4DpZKwNIapMoRM8OWJIEVYIFoIWRH0lKxxTnh19DHmLXtaplUCA84t
         +WpXbaO1jrhp1OQ2IezKFUaEtJS03nnMwP47lHxHJiBi5lCSsJVeBGhrAzoMnOsXHnB1
         7rrRWEjK7ugzNFHw2F2vU6zaJTY483ykuj4wq/uuJ/3eoe8+AyYwzbRNYC+UJPUCz3Gh
         E4eA==
X-Forwarded-Encrypted: i=1; AFNElJ8POOh8uhBFL7po2NgGeArYCsn1knZfyTP44ZMvyLX1DFvWYlnd/O87rNDOaJiuyoRI9yg=@kernel.org
X-Gm-Message-State: AOJu0YzQV8dKdEdsKKdnUQmIM5JMyxTqjUDaDfy0zr3D27jXYU+90Cjj
	2j37fD7IP0FupZM5aJ6n0r+JwpxryqRz8TnsQNFGZloIqhKvBAE19vRlZHBuCVkmI41nZrTUF25
	zWuEpuIJcStMaCQyI2LATeImhOLy4AHnpZmOBKaZ47PrlSl5o
X-Gm-Gg: Acq92OFcrSZL5DCumVCR/fvNdiO/TbboXnT/fv1nshKI1UGxwkKxyhI9fuS5yN+l8IB
	l3Ao4gxATZuqNoyaCas5hjbCvG2+/VzuaSnzNpLgCmzd1KWX46ZPn+iGx0XNFQm7RN5ecq1nW2y
	H5Uok8QjVs1Wg590J+E0esgptfiwm6W/GJzNFXqN9zT/ybImXp2wBJH2HbOGFIZTozRnFeSMdN9
	KCzkWmEcwO1tDeewYXTTWo0usgerFOCyHkMnMSyRHR3rpMHelA5A6UtR1PJewWCbmKMuHGHpMgM
	UMHot4PoehwsT3++2Vh08omw6tmJm3fcOFWQXkqYh0Iqrb35v/ESpE8L/RDh8XQ3vYuTYx7LdvT
	qsNWYv9QEmhdV3BdmR1f3AHKznXf5ntnyvaFUKKtiyAa+rHp3yA==
X-Received: by 2002:a05:622a:4ac7:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-514621c747cmr424346941cf.59.1778588297188;
        Tue, 12 May 2026 05:18:17 -0700 (PDT)
X-Received: by 2002:a05:622a:4ac7:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-514621c747cmr424346331cf.59.1778588296592;
        Tue, 12 May 2026 05:18:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm33563044f8f.30.2026.05.12.05.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:18:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: arm@kernel.org, soc@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] ARM: pxa: software node oriented GPIO rework for v7.2
Date: Tue, 12 May 2026 14:18:05 +0200
Message-ID: <20260512121805.26023-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kySrH3Am0-IlqliLDmfxvOjExvG9J2PE
X-Proofpoint-ORIG-GUID: kySrH3Am0-IlqliLDmfxvOjExvG9J2PE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNyBTYWx0ZWRfX3Zh/7vB220rW
 qTl/08L6zCoittRlS0glsvIG/+DBe9ZoCzsobZ0Vb/g8vH+G0mox3oD85kJtPbSL2Ng2G+GDpoQ
 bRwD3+ykMcSrUeTevt+A+26W1FK9t41zEYhqJJZde+dRwsEYAL4pLEaWmBSuObvMN0qzKonxTQ/
 AcZNlN9BfnVHODX+mU75knXQMGgoOd7J70j7LFmKXpVPKsT0SH6Tn5Gb85EaVQHKUOcvLyAnWne
 A14PFT41sxC031EaM826PHMHs7JLgzoEn9jSwXyWsbUIeRuoQUyA/kkQFvBwWjUqNv24IssXvfy
 NEFVhQNgoP6W8VQdJfxDRFUd6sYBw5r+6EbmccNhosw8Q6lpcWpH4WXWFRWokU4Rqnffk0E3/2A
 Qmm6vmyW1b03By9cLlJqUjc5FDFMn3DfJ1cjKDswaNvbrNxj6QdBaZW8GZyh/pZTMKGNHimUVct
 YN4axd9VwYhaDepjfzQ==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a031a89 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=-_aiTBz_rQ-7vHLFHe4A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120127

Hi SoC maintainers!

As suggested by Linus[1] I'm sending this as a PR for inclusion in the
SoC tree for v7.2. This is a rework attaching software nodes to their
target GPIO controllers on PXA platforms that will allow us to remove the
unwanted behavior of GPIOLIB where software node lookup can work on
matching of software node names against GPIO controllers' labels.

Please consider pulling,
Bartosz Golaszewski

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/soc-pxa-gpio-for-v7.2

for you to fetch changes up to 2c450dd88161abbadf889711d0bcedd7a0504a84:

  ARM: pxa: pxa27x: attach software node to its target GPIO controller (2026-05-12 14:03:19 +0200)

----------------------------------------------------------------
ARM: pxa: software node oriented GPIO rework for v7.2

- attach software nodes to their target GPIO controllers on PXA
  platforms

----------------------------------------------------------------
Bartosz Golaszewski (4):
      ARM: pxa: statify platform device definitions in spitz board file
      ARM: pxa: spitz: attach software nodes to their target GPIO controllers
      ARM: pxa: pxa25x: attach software node to its target GPIO controller
      ARM: pxa: pxa27x: attach software node to its target GPIO controller

 arch/arm/mach-pxa/pxa25x.c |  3 +++
 arch/arm/mach-pxa/pxa27x.c |  3 +++
 arch/arm/mach-pxa/spitz.c  | 11 ++++++++---
 3 files changed, 14 insertions(+), 3 deletions(-)
